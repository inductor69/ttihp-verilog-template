(* SPI host interface.

   A mode-0 SPI slave (MSB first) through which an external host loads the
   program/data memories, controls the core, and exchanges bytes with the FIFOs.
   This is what makes the chip reprogrammable after fabrication.

   Wire protocol, one command per CS-low transaction:
     0x01 PROG_ADDR  <hi> <lo>      set program write address
     0x02 PROG_DATA  <hi> <lo>      write 16-bit word, address auto-increments
     0x03 DATA_ADDR  <b>            set data read/write address
     0x04 DATA_WRITE <b>            write data byte, address auto-increments
     0x05 DATA_READ                 read data byte -> MISO (8 clocks)
     0x06 CTRL       <b>            b0 = run, b1 = reset core (pulse)
     0x07 STATUS                    status byte -> MISO (8 clocks)
     0x08 FIFO_PUSH  <b>            push byte into core RX FIFO
     0x09 FIFO_POP                  pop byte from core TX FIFO -> MISO *)

open Base
open Hardcaml
open Always

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; cs_n : 'a
    ; sck : 'a
    ; mosi : 'a
    ; data_read : 'a [@bits 8]
    ; fifo_tx_empty : 'a
    ; fifo_tx_data : 'a [@bits 8]
    ; fifo_rx_full : 'a
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { miso : 'a
    ; data_rd_addr : 'a [@bits 8]
    ; prog_wr : 'a
    ; prog_wr_addr : 'a [@bits 8]
    ; prog_wr_data : 'a [@bits 16]
    ; data_wr : 'a
    ; data_wr_addr : 'a [@bits 8]
    ; data_wr_data : 'a [@bits 8]
    ; run : 'a
    ; reset_core : 'a
    ; fifo_rx_push : 'a
    ; fifo_rx_data : 'a [@bits 8]
    ; fifo_tx_pop : 'a
    ; cap_base : 'a [@bits 8]
    ; cap_ctrl : 'a [@bits 8]
    ; pat_base : 'a [@bits 8]
    ; pat_len : 'a [@bits 8]
    ; pat_ctrl : 'a [@bits 8]
    ; pat_data_wr : 'a
    ; pat_data_idx : 'a [@bits 4]
    ; pat_data_lo : 'a [@bits 8]
    ; pat_data_hi : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module State = struct
  type t =
    | Idle
    | Cmd
    | Input
    | Output
  [@@deriving sexp_of, compare, enumerate]
end

let create (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.reset () in
  (* Input synchronisers / edge detectors *)
  let cs1 = Always.Variable.reg spec ~width:1 in
  let cs2 = Always.Variable.reg spec ~width:1 in
  let cs3 = Always.Variable.reg spec ~width:1 in
  let sck1 = Always.Variable.reg spec ~width:1 in
  let sck2 = Always.Variable.reg spec ~width:1 in
  let sck3 = Always.Variable.reg spec ~width:1 in
  let cs_active = ~:(cs2.value) in
  let cs_rise = cs_active &: cs3.value in
  let cs_fall = cs2.value &: ~:(cs3.value) in
  let sck_rise = sck2.value &: ~:(sck3.value) in
  let sck_fall = ~:(sck2.value) &: sck3.value in
  (* Protocol state *)
  let sm = Always.State_machine.create (module State) spec in
  let bit_cnt = Always.Variable.reg spec ~width:4 in
  let shift = Always.Variable.reg spec ~width:8 in
  let tx_shift = Always.Variable.reg spec ~width:8 in
  let cmd = Always.Variable.reg spec ~width:8 in
  let count = Always.Variable.reg spec ~width:8 in
  let addr_hi = Always.Variable.reg spec ~width:8 in
  let data_hi = Always.Variable.reg spec ~width:8 in
  let wr_addr = Always.Variable.reg spec ~width:8 in
  let run = Always.Variable.reg spec ~width:1 in
  let cap_base = Always.Variable.reg spec ~width:8 in
  let cap_ctrl = Always.Variable.reg spec ~width:8 in
  let pat_base = Always.Variable.reg spec ~width:8 in
  let pat_len = Always.Variable.reg spec ~width:8 in
  let pat_ctrl = Always.Variable.reg spec ~width:8 in
  let pat_data_idx = Always.Variable.reg spec ~width:8 in
  let pat_data_lo = Always.Variable.reg spec ~width:8 in
  let byte_done = sck_rise &: (bit_cnt.value ==:. 7) in
  let in_byte = sm.is State.Input &: byte_done in
  (* Value the shift register takes when this byte completes (the 8th bit is
     only clocked in on the byte-done edge, so decode/apply against this). *)
  let new_shift = select shift.value 6 0 @: i.mosi -- "new_shift" in
  let is_cmd c = new_shift ==:. c in
  let last = count.value ==:. 1 in
  (* Command decode at end of command byte *)
  let next_input =
    is_cmd 0x01 |: is_cmd 0x02 |: is_cmd 0x03 |: is_cmd 0x04 |: is_cmd 0x06 |: is_cmd 0x08
    |: is_cmd 0x0A |: is_cmd 0x0B |: is_cmd 0x0C
  in
  let next_output = is_cmd 0x05 |: is_cmd 0x07 |: is_cmd 0x09 in
  let next_count =
    mux2 (is_cmd 0x0B |: is_cmd 0x0C) (of_int ~width:8 3)
      (mux2 (is_cmd 0x01 |: is_cmd 0x02 |: is_cmd 0x0A) (of_int ~width:8 2)
         (of_int ~width:8 1))
  in
  let status =
    zero 4 @: i.fifo_rx_full @: (~:(i.fifo_tx_empty)) @: vdd @: run.value -- "status"
  in
  let next_tx =
    mux2 (is_cmd 0x05) i.data_read
      (mux2 (is_cmd 0x07) status
         (mux2 (is_cmd 0x09)
            (mux2 i.fifo_tx_empty (of_int ~width:8 0xff) i.fifo_tx_data)
            (zero 8)))
  in
  compile
    [ cs1 <-- i.cs_n
    ; cs2 <-- cs1.value
    ; cs3 <-- cs2.value
    ; sck1 <-- i.sck
    ; sck2 <-- sck1.value
    ; sck3 <-- sck2.value
    ; when_ cs_rise [ bit_cnt <--. 0; count <--. 0; sm.set_next State.Cmd ]
    ; when_ cs_fall [ bit_cnt <--. 0; count <--. 0; sm.set_next State.Idle ]
    ; when_ sck_rise
        [ when_ cs_active
            [ shift <-- (select shift.value 6 0 @: i.mosi)
            ; if_ (bit_cnt.value ==:. 7)
                [ bit_cnt <--. 0
                ; sm.switch
                    [ ( State.Cmd
                      , [ cmd <-- new_shift
                        ; when_ next_input [ count <-- next_count; sm.set_next State.Input ]
                        ; when_ next_output
                            [ tx_shift <-- next_tx; sm.set_next State.Output ]
                        ; when_ (~: next_input &: ~: next_output) [ sm.set_next State.Idle ]
                        ] )
                    ; ( State.Input
                      , [ count <-- count.value -:. 1
                        ; if_ (cmd.value ==:. 0x01)
                            [ if_ last [ wr_addr <-- new_shift ] [ addr_hi <-- new_shift ] ]
                            []
                        ; when_
                            (cmd.value ==:. 0x02 &: last)
                            [ wr_addr <-- wr_addr.value +:. 1 ]
                        ; when_ (cmd.value ==:. 0x02 &: ~: last) [ data_hi <-- new_shift ]
                        ; when_ (cmd.value ==:. 0x03) [ wr_addr <-- new_shift ]
                        ; when_ (cmd.value ==:. 0x04) [ wr_addr <-- wr_addr.value +:. 1 ]
                        ; when_ (cmd.value ==:. 0x06) [ run <-- bit new_shift 0 ]
                        ; when_ (cmd.value ==:. 0x0A)
                            [ if_ last [ cap_ctrl <-- new_shift ] [ cap_base <-- new_shift ] ]
                        ; when_ (cmd.value ==:. 0x0B)
                            [ if_ last [ pat_ctrl <-- new_shift ]
                                [ if_ (count.value ==:. 2) [ pat_len <-- new_shift ]
                                    [ pat_base <-- new_shift ] ] ]
                        ; when_ (cmd.value ==:. 0x0C)
                            [ if_ (count.value ==:. 3) [ pat_data_idx <-- new_shift ]
                                [ when_ (count.value ==:. 2) [ pat_data_lo <-- new_shift ] ] ]
                        ; when_ last [ sm.set_next State.Idle ]
                        ] )
                    ; ( State.Output
                      , [] (* shift-out continues until CS rises *)
                      )
                    ; (State.Idle, [])
                    ]
                ]
                [ bit_cnt <-- bit_cnt.value +:. 1 ]
            ]
        ]
    ; when_ sck_fall
        [ when_ (cs_active &: sm.is State.Output)
            [ tx_shift <-- (select tx_shift.value 6 0 @: zero 1) ]
        ]
    ];
  { O.miso = mux2 (cs_active &: sm.is State.Output) (bit tx_shift.value 7) gnd -- "miso"
  ; data_rd_addr = wr_addr.value -- "host_data_rd_addr"
  ; prog_wr = (in_byte &: (cmd.value ==:. 0x02) &: last) -- "prog_wr"
  ; prog_wr_addr = wr_addr.value -- "prog_wr_addr"
  ; prog_wr_data = data_hi.value @: new_shift -- "prog_wr_data"
  ; data_wr = (in_byte &: (cmd.value ==:. 0x04)) -- "data_wr"
  ; data_wr_addr = wr_addr.value -- "data_wr_addr"
  ; data_wr_data = new_shift -- "data_wr_data"
  ; run = run.value -- "run"
  ; reset_core = (in_byte &: (cmd.value ==:. 0x06) &: bit new_shift 1) -- "reset_core"
  ; fifo_rx_push = (in_byte &: (cmd.value ==:. 0x08) &: ~:(i.fifo_rx_full)) -- "fifo_rx_push"
  ; fifo_rx_data = new_shift -- "fifo_rx_data"
  ; fifo_tx_pop =
      (sm.is State.Cmd &: byte_done &: (is_cmd 0x09) &: ~:(i.fifo_tx_empty)) -- "fifo_tx_pop"
  ; cap_base = cap_base.value -- "cap_base"
  ; cap_ctrl = cap_ctrl.value -- "cap_ctrl"
  ; pat_base = pat_base.value -- "pat_base"
  ; pat_len = pat_len.value -- "pat_len"
  ; pat_ctrl = pat_ctrl.value -- "pat_ctrl"
  ; pat_data_wr = (in_byte &: (cmd.value ==:. 0x0C) &: last) -- "pat_data_wr"
  ; pat_data_idx = select pat_data_idx.value 3 0 -- "pat_data_idx"
  ; pat_data_lo = pat_data_lo.value -- "pat_data_lo"
  ; pat_data_hi = new_shift -- "pat_data_hi"
  }