(* ProtoCore CPU.

   An 8-bit, Harvard, one-instruction-per-cycle core with an ISA tuned for
   bit-banging: direct pin read/write, a shift register for serial data, a
   free-running cycle counter for absolute-time waits, and exact-cost DELAY.

   Program memory: 256 x 16 (SRAM). Data memory: 256 x 8 (SRAM).
   The host loads program/data memory through [prog_wr*]/[data_wr*] and starts
   the core with [enable].

   Timing contract (see Isa): every instruction is one cycle except DELAY
   (imm+1), WAITCYC/WAITPIN (variable) and PUSH/PULL (stall on FIFO). *)

open Base
open Hardcaml
open Always

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a (* active high *)
    ; enable : 'a (* 1 = run *)
    ; pins_in : 'a [@bits 8]
    ; prog_wr : 'a
    ; prog_wr_addr : 'a [@bits 8]
    ; prog_wr_data : 'a [@bits 16]
    ; data_wr : 'a
    ; data_wr_addr : 'a [@bits 8]
    ; data_wr_data : 'a [@bits 8]
    ; data_rd_addr : 'a [@bits 8]
    ; cap_wr : 'a
    ; cap_wr_addr : 'a [@bits 8]
    ; cap_wr_data : 'a [@bits 8]
    ; fifo_tx_full : 'a
    ; fifo_rx_empty : 'a
    ; fifo_rx_data : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { pins_out : 'a [@bits 8]
    ; oe : 'a [@bits 8]
    ; fifo_tx_push : 'a
    ; fifo_tx_data : 'a [@bits 8]
    ; fifo_rx_pop : 'a
    ; data_out : 'a [@bits 8]
    ; running : 'a
    ; pc_out : 'a [@bits 8]
    ; cyc_out : 'a [@bits 16]
    ; regs_out : 'a [@bits 64]
    }
  [@@deriving sexp_of, hardcaml]
end

let concat_msb = Signal.concat_msb

let create ?(sram = false) (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.reset () in
  (* Architectural state *)
  let pc = Always.Variable.reg spec ~width:8 in
  let a = Always.Variable.reg spec ~width:8 in
  let x = Always.Variable.reg spec ~width:8 in
  let y = Always.Variable.reg spec ~width:8 in
  let pins = Always.Variable.reg spec ~width:8 in
  let oe = Always.Variable.reg spec ~width:8 in
  let shift = Always.Variable.reg spec ~width:8 in
  let sr = Always.Variable.reg spec ~width:8 in
  let tmp = Always.Variable.reg spec ~width:8 in
  let dly = Always.Variable.reg spec ~width:8 in
  let cyc = Always.Variable.reg spec ~width:16 in
  let ir = Always.Variable.reg spec ~width:16 in (* synchronous fetch stage *)
  let ld_stall = Always.Variable.reg spec ~width:1 in (* synchronous data read: LD takes 2 cycles *)
  let ld_addr = Always.Variable.reg spec ~width:8 in
  let prog_addr_w = Signal.wire 8 in (* SRAM read address, driven after fetch_addr *)
  let prog_ren_w = Signal.wire 1 in
  let sram_dout =
    if sram then
      Sram.sram_1p_256x16 ~clock:i.clock ~addr:prog_addr_w ~din:i.prog_wr_data
        ~wen:i.prog_wr ~ren:prog_ren_w
    else
      Signal.gnd
  in
  let instr_src = if sram then sram_dout else ir.value in
  (* Decode from the instruction source (program SRAM read is synchronous). *)
  let op = select instr_src 15 11 -- "op" in
  let arg = select instr_src 10 8 -- "arg" in
  let imm = select instr_src 7 0 -- "imm" in
  let op_is k = op ==:. k in
  let arg_is k = arg ==:. k in
  let z = bit sr.value 0 in
  let c = bit sr.value 1 in
  let x_dec = x.value -:. 1 in
  let pin_bits = List.init 8 ~f:(fun k -> bit i.pins_in k) in
  let pin_arg_bit = mux arg pin_bits -- "pin_arg" in
  let pin_imm_bit = mux (select imm 2 0) pin_bits -- "pin_imm" in
  (* Branch condition / next fetch address (computed before the memory). *)
  let branch_taken =
    op_is 0x10 (* jmp *)
    |: (op_is 0x11 &: z)
    |: (op_is 0x12 &: ~: z)
    |: (op_is 0x13 &: c)
    |: (op_is 0x14 &: ~: c)
    |: (op_is 0x15 &: pin_arg_bit)
    |: (op_is 0x16 &: ~: pin_arg_bit)
    |: (op_is 0x17 &: (x_dec <>:. 0))
    -- "branch_taken"
  in
  let fetch_addr = mux2 branch_taken imm pc.value -- "fetch_addr" in
  let () =
    if sram then begin
      Signal.assign prog_addr_w (mux2 i.prog_wr i.prog_wr_addr fetch_addr)
    end
  in
  (* Program memory: flop memory + IR register (sim) or the IHP SRAM macro
     whose registered output is the instruction (synthesis). *)
  let prog_mem =
    if sram then Signal.gnd
    else
      Signal.memory 256
        ~write_port:
          { Write_port.write_clock = i.clock
          ; write_address = i.prog_wr_addr
          ; write_enable = i.prog_wr
          ; write_data = i.prog_wr_data
          }
        ~read_address:fetch_addr
        |> fun s -> s -- "prog_mem_rdata"
  in
  (* Stall logic (depends only on opcode / state, computed before memories). *)
  let delay_done = dly.value ==: imm in
  let waitcyc_done = select cyc.value 7 0 ==: imm in
  let waitpin_done = pin_arg_bit ==: bit imm 0 in
  let ld_active = op_is 0x1E |: op_is 0x0A in (* LD / LDY *)
  let advance =
    mux2 (op_is 0x0D) delay_done
      (mux2 (op_is 0x0E) waitcyc_done
         (mux2 (op_is 0x0F) waitpin_done
            (mux2 (op_is 0x1C) (~:(i.fifo_tx_full))
               (mux2 (op_is 0x1D) (~:(i.fifo_rx_empty))
                  (mux2 ld_active ld_stall.value vdd)))))
    -- "advance"
  in
  let () =
    if sram then
      (* The macro output itself is the instruction register.  Disable its
         read port while a variable-latency instruction stalls so the current
         opcode cannot be replaced by the following instruction. *)
      Signal.assign prog_ren_w ((~:(i.prog_wr)) &: (advance |: ~:(i.enable)))
  in
  let ir_next = if sram then sram_dout else mux2 advance prog_mem ir.value in
  (* Register file read muxes *)
  let reg_vals =
    [ a.value; x.value; y.value; pins.value; oe.value; shift.value; sr.value; tmp.value ]
  in
  let reg_val = mux arg reg_vals -- "reg_val" in
  let reg_of_src = mux (select imm 2 0) reg_vals -- "reg_src" in
  (* ALU *)
  let alu = select op 2 0 in
  let imm9 = zero 1 @: imm in
  let sum9 = (zero 1 @: reg_val) +: imm9 in
  let diff9 = (zero 1 @: reg_val) -: imm9 in
  let alu_sum = select sum9 7 0 in
  let alu_diff = select diff9 7 0 in
  let alu_carry = bit sum9 8 in
  let alu_borrow = bit diff9 8 in
  let shift_count = mux2 (imm ==:. 0) (of_int ~width:8 8) imm in
  let alu_shl = log_shift sll reg_val shift_count in
  let alu_shr = log_shift srl reg_val shift_count in
  let shl_c = bit reg_val 7 in (* carry = bit shifted out (count 1) *)
  let shr_c = bit reg_val 0 in
  let alu_result =
    mux alu
      [ alu_shl; alu_shr; alu_sum; alu_sum; alu_diff
      ; reg_val &: imm; reg_val |: imm; reg_val ^: imm
      ]
    -- "alu_result"
  in
  let alu_cflag =
    mux alu [ shl_c; shr_c; zero 1; alu_carry; alu_borrow; zero 1; zero 1; zero 1 ]
  in
  let sr_next = zero 6 @: alu_cflag @: (alu_result ==:. 0) in
(* Data memory: core LD/ST/LDY/STY (read port 0), host write and read (port 1). *)
  let st_wr = advance &: op_is 0x1F in
  let sty_wr = advance &: op_is 0x0B in
  let core_wr_addr = mux2 (op_is 0x0B) y.value imm in
  let data_wr_en = i.data_wr |: st_wr |: sty_wr |: i.cap_wr in
  let data_wr_addr = mux2 i.cap_wr i.cap_wr_addr (mux2 i.data_wr i.data_wr_addr core_wr_addr) in
  let data_wr_data = mux2 i.cap_wr i.cap_wr_data (mux2 i.data_wr i.data_wr_data reg_val) in
  let ld_addr_next = mux2 (op_is 0x0A) y.value imm in
  let data_rd_addr =
    mux2 ld_active (mux2 ld_stall.value ld_addr.value ld_addr_next) i.data_rd_addr
  in
  let sram_din =
    if sram then
      Sram.sram_2p_256x8 ~clock:i.clock ~w_addr:data_wr_addr ~w_en:data_wr_en
        ~w_data:data_wr_data ~r_addr:data_rd_addr ~r_en:Signal.vdd
    else Signal.gnd
  in
  let data_mem =
    if sram then Signal.gnd
    else
      Signal.memory 256
        ~write_port:
          { Write_port.write_clock = i.clock
          ; write_address = data_wr_addr
          ; write_enable = data_wr_en
          ; write_data = data_wr_data
          }
        ~read_address:data_rd_addr
        |> fun s -> s -- "data_mem_rdata"
  in
  let data_read = Always.Variable.reg spec ~width:8 in (* synchronous read port *)
  let data_out = (if sram then sram_din else data_read.value) -- "data_mem_host_rdata" in
  let data_read_next = if sram then sram_din else data_mem in
  (* Opcode groups *)
  let is_alu = (op >=:. 3) &: (op <=:. 9) in
  let is_generic =
    op_is 0x01 (* ldi *) |: op_is 0x02 (* mov *) |: is_alu |: op_is 0x1E (* ld *)
    |: op_is 0x0A (* ldy *) |: op_is 0x18 (* in *) |: op_is 0x19 (* pinin *)
    |: op_is 0x1D (* pull *)
  in
  let load_value = if sram then sram_din else data_read.value in
  let write_value =
    mux2 (op_is 0x01) imm
      (mux2 (op_is 0x02) reg_of_src
         (mux2 (op_is 0x1E |: op_is 0x0A) load_value
            (mux2 (op_is 0x18) (zero 7 @: pin_imm_bit)
               (mux2 (op_is 0x19) i.pins_in
                  (mux2 (op_is 0x1D) i.fifo_rx_data alu_result)))))
    -- "reg_write_value"
  in
  (* Single-bit insert (pin index is a runtime signal). *)
  let insert_bit (base : Signal.t) (idx : Signal.t) (v : Signal.t) =
    let pieces k =
      let hi = if k >= 7 then [] else [ select base 7 (k + 1) ] in
      let lo = if k <= 0 then [] else [ select base (k - 1) 0 ] in
      concat_msb (hi @ [ v ] @ lo)
    in
    mux idx (List.init 8 ~f:pieces)
  in
  let pins_setpin = insert_bit pins.value arg (bit imm 0) in
  let pins_outs = insert_bit pins.value arg (bit shift.value 7) in
  let shift_outs = select shift.value 6 0 @: zero 1 in
  let shift_ins = select shift.value 6 0 @: pin_arg_bit in
  (* Next fetch pointer: always one past the address fetched this cycle. *)
  let pc_next = fetch_addr +:. 1 in
  let dly_next =
    mux2 (op_is 0x0D) (mux2 (dly.value <: imm) (dly.value +:. 1) (zero 8)) (zero 8)
  in
  let assign (r : Isa.reg) v =
    match r with
    | A -> a <-- v
    | X -> x <-- v
    | Y -> y <-- v
    | PINS -> pins <-- v
    | OE -> oe <-- v
    | SHIFT -> shift <-- v
    | SR -> sr <-- v
    | TMP -> tmp <-- v
  in
  let generic_writes =
    List.map Isa.all_regs ~f:(fun r ->
        when_ (arg_is (Isa.reg_index r)) [ assign r write_value ])
  in
  compile
    [ data_read <-- data_read_next (* synchronous memory read port, always active *)
    ; when_ i.enable
        [ cyc <-- cyc.value +:. 1
        ; dly <-- dly_next
        ; ir <-- ir_next (* fetch: hold on stall *)
        ; ld_addr <-- mux2 (ld_active &: ~:(ld_stall.value)) ld_addr_next ld_addr.value
        ; ld_stall <-- mux2 ld_active (~:(ld_stall.value)) (zero 1)
        ; when_ advance
            ([ pc <-- pc_next; when_ is_generic generic_writes ]
             @ [ when_ (op_is 0x0C) [ pins <-- pins_setpin ]
               ; when_ (op_is 0x1A) [ pins <-- pins_outs; shift <-- shift_outs ]
               ; when_ (op_is 0x1B) [ shift <-- shift_ins ]
               ; when_ (op_is 0x17) [ x <-- x_dec ]
               ; when_ is_alu [ sr <-- sr_next ]
               ])
        ]
    ];
  { O.pins_out = pins.value -- "pins_out"
  ; oe = oe.value -- "oe"
  ; fifo_tx_push = (advance &: op_is 0x1C) -- "fifo_tx_push"
  ; fifo_tx_data = a.value -- "fifo_tx_data"
  ; fifo_rx_pop = (advance &: op_is 0x1D) -- "fifo_rx_pop"
  ; data_out
  ; running = i.enable
  ; pc_out = pc.value -- "pc"
  ; cyc_out = cyc.value -- "cyc"
  ; regs_out =
      concat_msb [ a.value; x.value; y.value; pins.value; oe.value; shift.value; sr.value; tmp.value ]
  }
