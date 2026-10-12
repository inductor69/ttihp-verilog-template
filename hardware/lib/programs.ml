(* Firmware programs for ProtoCore, written in the assembler and loaded via the
   host SPI interface. Each program is cycle-exact: the assembler's
   [delay_cycles] is used to hit bit timing precisely.

   Pin conventions:
     UART: TX = pin 0
     SPI : CS = pin 0, CLK = pin 1, MOSI = pin 2, MISO = pin 3 (input)
     I2C : SCL = pin 0, SDA = pin 1
*)

open Base
open Isa
open Asm

let delay n = List.map (delay_cycles n) ~f:(fun d -> i d)

(* UART 8N1 transmitter, LSB first.
   [msg_addr]/[nbytes]: the message lives in data memory and is transmitted
   forever. Data bit timing is exactly [bit_time] core cycles.
   A software bit-reverse (using the carry flag, set by SHR) converts the byte
   to LSB-first order, since OUTS shifts the MSB out. *)
let uart_tx_program ~(msg_addr : int) ~(nbytes : int) ~(bit_time : int) : int array =
  let tx = 0 in
  let d_start = bit_time - 2 in
  let d_data = bit_time - 2 in (* Outs + Delay + Decjnz = 2 + d_data cycles *)
  let d_stop = bit_time - 5 in
  let lines =
    [ i (Ldi (OE, 0x01))
    ; i (Ldi (PINS, 0x01))
    ; i (Ldi (TMP, nbytes)) (* byte counter *)
    ; i (Ldi (Y, msg_addr))
    ; label "byte_loop" (Ldy SHIFT)
    ; i (Ldi (X, 8)) (* reverse counter *)
    ; i (Ldi (A, 0))
    ; label "rev_loop" (Shl (A, 1)) (* A <<= 1 *)
    ; i (Shr (SHIFT, 1)) (* carry = bit being reversed *)
    ; i (Jnc (Label "rev_skip"))
    ; i (Addi (A, 1)) (* bit = 1 *)
    ; label "rev_skip" (Decjnz (Label "rev_loop"))
    ; i (Mov (SHIFT, A)) (* SHIFT = bit-reversed char *)
    ; i (Ldi (X, 8)) (* data bit counter *)
    ; i (Setpin (tx, 0)) (* start bit *)
    ]
    @ delay d_start
    @ [ label "bit_loop" (Outs tx) ]
    @ delay d_data
    @ [ i (Decjnz (Label "bit_loop"))
      ; i (Setpin (tx, 1)) (* stop bit *)
      ]
    @ delay d_stop
    @ [ i (Addi (Y, 1))
      ; i (Subi (TMP, 1)) (* byte counter - 1, sets Z *)
      ; i (Jnz (Label "byte_loop"))
      ; i (Ldi (TMP, nbytes))
      ; i (Ldi (Y, msg_addr))
      ; i (Jmp (Label "byte_loop"))
      ]
  in
  assemble ~program_size:256 lines

(* SPI master (mode 0), MSB first. Sends [nbytes] from data memory starting at
   [msg_addr]. Each bit: drive MOSI, raise CLK, lower CLK. *)
let spi_master_program ~(msg_addr : int) ~(nbytes : int) ~(half : int) : int array =
  let cs = 0 and clk = 1 and mosi = 2 in
  let clk_mask = 1 lsl clk in
  let lines =
    [ i (Ldi (OE, 0x07)) (* cs, clk, mosi outputs; miso input *)
    ; i (Ldi (PINS, 0x01)) (* idle: cs high, clk low, mosi low *)
    ; i (Setpin (cs, 0)) (* assert CS *)
    ; i (Ldi (TMP, nbytes)) (* byte counter *)
    ; i (Ldi (Y, msg_addr))
    ; label "byte_loop" (Ldy SHIFT)
    ; i (Ldi (X, 8)) (* bit counter *)
    ; label "bit_loop" (Outs mosi)
    ; i (Xori (PINS, clk_mask)) (* CLK high *)
    ]
    @ delay half
    @ [ i (Xori (PINS, clk_mask)) (* CLK low *)
      ]
    @ delay half
    @ [ i (Decjnz (Label "bit_loop"))
      ; i (Addi (Y, 1))
      ; i (Subi (TMP, 1))
      ; i (Jnz (Label "byte_loop"))
      ; i (Setpin (cs, 1)) (* deassert CS *)
      ; i (Ldi (TMP, nbytes))
      ; i (Ldi (Y, msg_addr))
      ; i (Setpin (cs, 0))
      ; i (Jmp (Label "byte_loop"))
      ]
  in
  assemble ~program_size:256 lines

(* SPI mode-0 full-duplex master. Each transmitted byte is replaced in-place
   by the simultaneously received MISO byte. The two branch paths used to
   accumulate MISO are cycle-balanced. *)
let spi_master_full_duplex_program
    ~(buffer_addr : int)
    ~(nbytes : int)
    ~(half : int) : int array =
  let cs = 0 and clk = 1 and mosi = 2 and miso = 3 in
  let lines =
    [ i (Ldi (OE, 0x07))
    ; i (Ldi (PINS, 0x01))
    ; i (Setpin (cs, 0))
    ; i (Ldi (TMP, nbytes))
    ; i (Ldi (Y, buffer_addr))
    ; label "byte_loop" (Ldy SHIFT)
    ; i (Ldi (A, 0))
    ; i (Ldi (X, 8))
    ; label "bit_loop" (Outs mosi)
    ; i (Setpin (clk, 1))
    ]
    @ delay half
    @ [ i (Shl (A, 1))
      ; i (Jb (miso, Label "miso_one"))
      ; i Nop
      ; i (Jmp (Label "miso_done"))
      ; label "miso_one" (Addi (A, 1))
      ; i Nop
      ; label "miso_done" (Setpin (clk, 0))
      ]
    @ delay half
    @ [ i (Decjnz (Label "bit_loop"))
      ; i (Sty A)
      ; i (Addi (Y, 1))
      ; i (Subi (TMP, 1))
      ; i (Jnz (Label "byte_loop"))
      ; i (Setpin (cs, 1))
      ; label "halt" (Jmp (Label "halt"))
      ]
  in
  assemble ~program_size:256 lines

(* I2C master (push-pull demo), SCL=p0 SDA=p1. START, then [nbytes] bytes with
   ACK sampling, then STOP. Repeats forever. *)
let i2c_master_program ~(msg_addr : int) ~(nbytes : int) ~(half : int) : int array =
  let scl = 0 and sda = 1 in
  let lines =
    [ i (Ldi (OE, 0x03)) (* both push-pull outputs *)
    ; i (Ldi (PINS, 0x03)) (* idle high *)
    ; i (Ldi (TMP, nbytes)) (* byte counter *)
    ; i (Ldi (Y, msg_addr))
    ; label "start" (Setpin (sda, 0)) (* SDA low while SCL high = START *)
    ; i (Setpin (scl, 0)) (* SCL low *)
    ; label "byte_loop" (Ldy SHIFT)
    ; i (Ldi (X, 8)) (* bit counter *)
    ; label "bit_loop" (Outs sda) (* SDA = SHIFT[7]; SHIFT<<=1 *)
    ; i (Setpin (scl, 1)) (* SCL high *)
    ]
    @ delay half
    @ [ i (Setpin (scl, 0)) (* SCL low *)
      ]
    @ delay half
    @ [ i (Decjnz (Label "bit_loop"))
      ; i (Setpin (sda, 1)) (* release SDA (input side) *)
      ; i (Setpin (scl, 1)) (* 9th clock, ACK window *)
      ]
    @ delay half
    @ [ i (In (A, sda)) (* sample ACK *)
      ; i (Setpin (scl, 0))
      ]
    @ delay half
    @ [ i (Setpin (scl, 1)) (* STOP: SCL high, then SDA rising *)
      ]
    @ delay half
    @ [ i (Setpin (sda, 1))
      ; i (Setpin (scl, 0))
      ; i (Addi (Y, 1))
      ; i (Subi (TMP, 1))
      ; i (Jnz (Label "byte_loop"))
      ; i (Ldi (TMP, nbytes))
      ; i (Ldi (Y, msg_addr))
      ; i (Jmp (Label "start"))
      ]
  in
  assemble ~program_size:256 lines

(* Open-drain I2C master. PINS stays zero and OE acts as the open-drain drive:
   OE=1 pulls a line low, OE=0 releases it to an external pull-up. The master
   waits for sampled SCL high after every release, supporting slave clock
   stretching. ACK is sampled into A after each byte. *)
let i2c_master_open_drain_program
    ~(msg_addr : int)
    ~(nbytes : int)
    ~(half : int) : int array =
  let scl = 0 and sda = 1 in
  let lines =
    [ i (Ldi (PINS, 0x00))
    ; i (Ldi (OE, 0x00)) (* bus released/idle *)
    ; i (Ldi (TMP, nbytes))
    ; i (Ldi (Y, msg_addr))
    ; i (Waitpin (scl, 1))
    ; label "start" (Ldi (OE, 0x02)) (* pull SDA low while SCL high *)
    ]
    @ delay half
    @ [ i (Ldi (OE, 0x03)) (* pull both low *)
      ; label "byte_loop" (Ldy SHIFT)
      ; i (Ldi (X, 8))
      ; label "bit_loop" (Shl (SHIFT, 1))
      ; i (Jc (Label "send_one"))
      ; i (Ldi (OE, 0x03)) (* zero: SCL and SDA low *)
      ; i (Jmp (Label "data_set"))
      ; label "send_one" (Ldi (OE, 0x01)) (* one: SDA released, SCL low *)
      ; i Nop
      ]
    @ delay half
    @ [ label "data_set" (Jc (Label "clock_high_one"))
      ; i (Ldi (OE, 0x02)) (* zero: SDA low, SCL released *)
      ; i (Jmp (Label "clock_released"))
      ; label "clock_high_one" (Ldi (OE, 0x00)) (* both released *)
      ; i Nop
      ; label "clock_released" (Waitpin (scl, 1)) (* clock stretching *)
      ]
    @ delay half
    @ [ i (Ldi (OE, 0x01)) (* SCL low, SDA released temporarily *)
      ; i (Decjnz (Label "bit_loop"))
      ; i (Ldi (OE, 0x01)) (* release SDA for ACK *)
      ]
    @ delay half
    @ [ i (Ldi (OE, 0x00)) (* release SCL *)
      ; i (Waitpin (scl, 1))
      ]
    @ delay half
    @ [ i (In (A, sda)) (* 0 = ACK, 1 = NACK *)
      ; i (Ldi (OE, 0x01)) (* pull SCL low *)
      ; i (Addi (Y, 1))
      ; i (Subi (TMP, 1))
      ; i (Jnz (Label "byte_loop"))
      ; i (Ldi (OE, 0x03)) (* prepare STOP with both low *)
      ]
    @ delay half
    @ [ i (Ldi (OE, 0x02)) (* release SCL, keep SDA low *)
      ; i (Waitpin (scl, 1))
      ]
    @ delay half
    @ [ i (Ldi (OE, 0x00)) (* release SDA while SCL high = STOP *)
      ; label "halt" (Jmp (Label "halt"))
      ]
  in
  assemble ~program_size:256 lines

(* Toggle pin 0: high for [d]+1 cycles, low for [d]+1 cycles. Used to verify
   DELAY timing is cycle-exact. *)
let blink_program ~(d : int) : int array =
  let lines =
    [ i (Ldi (OE, 0x01))
    ; i (Ldi (PINS, 0x00))
    ; label "loop" (Setpin (0, 1))
    ]
    @ delay d
    @ [ i (Setpin (0, 0)) ]
    @ delay d
    @ [ i (Jmp (Label "loop")) ]
  in
  assemble ~program_size:256 lines

(* UART 8N1 receiver, LSB first. RX = pin 0 (input).
   Waits for a falling edge (start bit), samples each data bit at its midpoint
   using [Ins] (which accumulates LSB-first), stores the byte at the buffer
   addressed by Y, pushes it to the host FIFO, then skips the stop bit. *)
let uart_rx_program ~(buffer_addr : int) ~(bit_time : int) : int array =
  let rx = 0 in
  (* Initial wait: 1.5 bit times to the middle of data bit 0. *)
  let initial_delay = bit_time + (bit_time / 2) in
  let d_data = bit_time - 2 in (* Ins + Delay + Decjnz = 2 + d_data cycles *)
  let lines =
    [ i (Ldi (OE, 0x00)) (* all inputs *)
    ; i (Ldi (Y, buffer_addr))
    ; label "wait_high" (Jnb (rx, Label "wait_high")) (* until pin high *)
    ; label "wait_low" (Jb (rx, Label "wait_low")) (* until start (falling edge) *)
    ]
    @ delay initial_delay
    @ [ i (Ldi (X, 8))
      ; label "bit_loop" (Ins rx)
      ]
    @ delay d_data
    @ [ i (Decjnz (Label "bit_loop"))
      ; i (Ldi (A, 0)) (* bit-reverse: Ins left-shifts, so first sample is MSB *)
      ; i (Ldi (X, 8))
      ; label "rev_loop" (Shl (A, 1))
      ; i (Shr (SHIFT, 1)) (* carry = LSB of SHIFT *)
      ; i (Jnc (Label "rev_skip"))
      ; i (Addi (A, 1))
      ; label "rev_skip" (Decjnz (Label "rev_loop"))
      ; i (Mov (SHIFT, A))
      ; i (Sty SHIFT) (* data[Y] = byte *)
      ; i (Addi (Y, 1))
      ; i (Mov (A, SHIFT))
      ; i (Push)
      ]
    @ delay bit_time (* skip the stop bit *)
    @ [ i (Jmp (Label "wait_high"))
      ]
  in
  assemble ~program_size:256 lines

(* A tiny program exercising the arithmetic/branch/flags unit for unit tests. *)
let arithmetic_program () : int array =
  let lines =
    [ i (Ldi (A, 5))
    ; i (Addi (A, 3)) (* 8 *)
    ; i (Subi (A, 2)) (* 6 *)
    ; i (Shl (A, 2)) (* 24 *)
    ; i (Shr (A, 3)) (* 3 *)
    ; i (St (A, 0)) (* data[0] = 3 *)
    ; i (Ldi (A, 0xff))
    ; i (Andi (A, 0x0f)) (* 15 *)
    ; i (Ori (A, 0x10)) (* 31 *)
    ; i (Xori (A, 0xff)) (* 0xe0 *)
    ; i (St (A, 1)) (* data[1] = 0xe0 *)
    ; i (Ldi (X, 4))
    ; label "l1" (Addi (A, 1))
    ; i (Decjnz (Label "l1")) (* A += 4 -> 0xe4 *)
    ; i (St (A, 2))
    ; i (Jmp (Addr 15))
    ]
  in
  assemble ~program_size:256 lines

(* JTAG master: reset the TAP, walk to Shift-DR and read the 32-bit IDCODE
   (default DR after Test-Logic-Reset) into data memory [out_addr..+3],
   least-significant byte first, then return the TAP to Run-Test/Idle.
   Pins: TCK = 0, TMS = 1, TDI = 2 (held 0), TDO = 3 (input).
   [half] is the TCK half-period in core cycles. TDO is sampled while TCK is
   high, which is after the TAP has updated TDO on the previous falling edge. *)
let jtag_idcode_program ~(out_addr : int) ~(half : int) : int array =
  let tck = 0x01 in
  let tms_bit = 0x02 in
  let sample_n = ref 0 in
  (* One TCK cycle with the given TMS value; optionally sample TDO into the
     MSB of SHIFT (after shifting right), i.e. an LSB-first accumulator. *)
  let clock ~tms ~sample =
    let low = if tms = 1 then tms_bit else 0 in
    let sample_lines =
      if not sample then []
      else begin
        Int.incr sample_n;
        let skip = Printf.sprintf "tdo_skip_%d" !sample_n in
        [ i (Shr (SHIFT, 1)); i (Jnb (3, Label skip)); i (Ori (SHIFT, 0x80)) ]
        @ [ label skip Nop ]
      end
    in
    [ i (Setpins (low lor tck)) ]
    @ delay half
    @ sample_lines
    @ [ i (Setpins low) ]
    @ delay half
  in
  let lines =
    [ i (Ldi (OE, 0x07)); i (Setpins 0x00) ]
    @ List.concat (List.init 5 ~f:(fun _ -> clock ~tms:1 ~sample:false)) (* reset *)
    @ clock ~tms:0 ~sample:false (* Run-Test/Idle *)
    @ clock ~tms:1 ~sample:false (* Select-DR *)
    @ clock ~tms:0 ~sample:false (* Capture-DR *)
    @ clock ~tms:0 ~sample:false (* Shift-DR *)
    @ [ i (Ldi (Y, out_addr)); i (Ldi (A, 3)) ]
    @ [ label "jb_byte" (Ldi (SHIFT, 0)); i (Ldi (X, 8)); label "jb_bit" Nop ]
    @ clock ~tms:0 ~sample:true
    @ [ i (Decjnz (Label "jb_bit"))
      ; i (Sty SHIFT)
      ; i (Addi (Y, 1))
      ; i (Subi (A, 1))
      ; i (Jnz (Label "jb_byte"))
      ; (* last byte: 7 bits with TMS=0, then the final bit with TMS=1 *)
        i (Ldi (SHIFT, 0))
      ; i (Ldi (X, 7))
      ; label "jb_last" Nop
      ]
    @ clock ~tms:0 ~sample:true
    @ [ i (Decjnz (Label "jb_last")) ]
    @ clock ~tms:1 ~sample:true (* Exit1-DR *)
    @ [ i (Sty SHIFT) ]
    @ clock ~tms:1 ~sample:false (* Update-DR *)
    @ clock ~tms:0 ~sample:false (* Run-Test/Idle *)
    @ [ label "jb_done" (Jmp (Label "jb_done")) ]
  in
  assemble ~program_size:256 lines

(* SWD master: line reset, JTAG-to-SWD switch (0xE79E), line reset, then a DP
   read of DPIDR (request 0xA5). Stores the 32-bit DPIDR LSB first at
   [out_addr..+3], the 3-bit ACK at [out_addr+4] (1 = OK) and the received
   parity bit at [out_addr+5].  SWCLK = pin 0 (output), SWDIO = pin 1
   (bidirectional: OE released for the turnaround and the target's reply).
   The target updates SWDIO after SWCLK rises and the master samples it just
   before SWCLK falls; the host changes SWDIO while SWCLK is low.  Bytes are
   pre-reversed because OUTS shifts the MSB out first. *)
let swd_dpidr_program ~(out_addr : int) ~(half : int) : int array =
  let clk = 0 and dio = 1 in
  let n = ref 0 in
  let pulse ~sample =
    let sample_lines =
      if not sample then []
      else begin
        Int.incr n;
        let skip = Printf.sprintf "swd_skip_%d" !n in
        [ i (Shr (SHIFT, 1)); i (Jnb (dio, Label skip)); i (Ori (SHIFT, 0x80))
        ; label skip Nop ]
      end
    in
    [ i (Setpin (clk, 1)) ] @ delay half @ sample_lines @ [ i (Setpin (clk, 0)) ] @ delay half
  in
  let loop name ~count body =
    [ i (Ldi (X, count)); label name Nop ] @ body @ [ i (Decjnz (Label name)) ]
  in
  let send_byte name rev =
    [ i (Ldi (SHIFT, rev)) ] @ loop name ~count:8 ([ i (Outs dio) ] @ pulse ~sample:false)
  in
  let line_reset name =
    [ i (Setpin (dio, 1)) ] @ loop name ~count:56 (pulse ~sample:false)
  in
  let lines =
    [ i (Ldi (OE, 0x03)); i (Setpins 0x02) ]
    @ line_reset "swd_r1"
    @ send_byte "swd_sw0" 0x79 (* 0x9E, reversed *)
    @ send_byte "swd_sw1" 0xE7 (* 0xE7, reversed *)
    @ line_reset "swd_r2"
    @ [ i (Setpin (dio, 0)) ]
    @ loop "swd_idle0" ~count:2 (pulse ~sample:false)
    @ send_byte "swd_req" 0xA5 (* start,AP=0,RnW=1,A=00,parity=1,stop,park *)
    @ [ i (Setoe 0x01) ]
    @ pulse ~sample:false (* turnaround *)
    @ [ i (Ldi (SHIFT, 0)) ]
    @ loop "swd_ack" ~count:3 (pulse ~sample:true)
    @ [ i (Shr (SHIFT, 5)); i (St (SHIFT, out_addr + 4)) ]
    @ [ i (Ldi (Y, out_addr)); i (Ldi (A, 4)) ]
    @ [ label "swd_byte" (Ldi (SHIFT, 0)) ]
    @ loop "swd_bit" ~count:8 (pulse ~sample:true)
    @ [ i (Sty SHIFT); i (Addi (Y, 1)); i (Subi (A, 1)); i (Jnz (Label "swd_byte")) ]
    @ [ i (Ldi (SHIFT, 0)) ]
    @ pulse ~sample:true (* parity *)
    @ [ i (Shr (SHIFT, 7)); i (St (SHIFT, out_addr + 5)) ]
    @ pulse ~sample:false (* turnaround back to host *)
    @ [ i (Setoe 0x03); i (Setpin (dio, 0)) ]
    @ loop "swd_idle1" ~count:8 (pulse ~sample:false)
    @ [ label "swd_done" (Jmp (Label "swd_done")) ]
  in
  assemble ~program_size:256 lines
