(* IHP SG13G2 SRAM macro blackboxes (from the sg13g2_sram PDK library).

   These instantiate the real macros for the ASIC flow. Their registered
   outputs match the design's synchronous-read behaviour (the core already
   registers the program fetch and the data read), so swapping them in does not
   change the timing model.

   Program: RM_IHPSG13_1P_256x16_c2_bm_bist (single port).
   Data:    RM_IHPSG13_2P_256x8_c2_bm_bist (port A = write, port B = read). *)

open Base
open Hardcaml

let sram_1p_256x16
    ~(clock : Signal.t)
    ~(addr : Signal.t)
    ~(din : Signal.t)
    ~(wen : Signal.t)
    ~(ren : Signal.t) : Signal.t =
  let open Signal in
  let outputs =
    Instantiation.create ~name:"RM_IHPSG13_1P_256x16_c2_bm_bist"
      ~inputs:
        [ "A_CLK", clock
        ; "A_MEN", vdd
        ; "A_WEN", wen
        ; "A_REN", ren
        ; "A_ADDR", addr
        ; "A_DIN", din
        ; "A_DLY", gnd
        ; "A_BM", ones 16
        ; "A_BIST_CLK", gnd
        ; "A_BIST_EN", gnd
        ; "A_BIST_MEN", gnd
        ; "A_BIST_WEN", gnd
        ; "A_BIST_REN", gnd
        ; "A_BIST_ADDR", zero 8
        ; "A_BIST_DIN", zero 16
        ; "A_BIST_BM", ones 16
        ]
      ~outputs:[ "A_DOUT", 16 ]
      ()
  in
  Map.find_exn outputs "A_DOUT"

let sram_2p_256x8
    ~(clock : Signal.t)
    ~(w_addr : Signal.t)
    ~(w_en : Signal.t)
    ~(w_data : Signal.t)
    ~(r_addr : Signal.t)
    ~(r_en : Signal.t) : Signal.t =
  let open Signal in
  let outputs =
    Instantiation.create ~name:"RM_IHPSG13_2P_256x8_c2_bm_bist"
      ~inputs:
        [ "A_CLK", clock
        ; "A_MEN", vdd
        ; "A_WEN", w_en
        ; "A_REN", gnd
        ; "A_ADDR", w_addr
        ; "A_DIN", w_data
        ; "A_DLY", gnd
        ; "A_BM", ones 8
        ; "A_BIST_CLK", gnd
        ; "A_BIST_EN", gnd
        ; "A_BIST_MEN", gnd
        ; "A_BIST_WEN", gnd
        ; "A_BIST_REN", gnd
        ; "A_BIST_ADDR", zero 8
        ; "A_BIST_DIN", zero 8
        ; "A_BIST_BM", ones 8
        ; "B_CLK", clock
        ; "B_MEN", vdd
        ; "B_WEN", gnd
        ; "B_REN", r_en
        ; "B_ADDR", r_addr
        ; "B_DIN", zero 8
        ; "B_DLY", gnd
        ; "B_BM", ones 8
        ; "B_BIST_CLK", gnd
        ; "B_BIST_EN", gnd
        ; "B_BIST_MEN", gnd
        ; "B_BIST_WEN", gnd
        ; "B_BIST_REN", gnd
        ; "B_BIST_ADDR", zero 8
        ; "B_BIST_DIN", zero 8
        ; "B_BIST_BM", ones 8
        ]
      ~outputs:[ "B_DOUT", 8 ]
      ()
  in
  Map.find_exn outputs "B_DOUT"