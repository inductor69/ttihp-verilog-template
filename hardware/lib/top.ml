(* Tiny Tapeout top level.

   Pin map:
     ui[0] = SPI CSn, ui[1] = SPI SCK, ui[2] = SPI MOSI
     uo[0] = SPI MISO, uo[1] = core running
     uio[7:0] = ProtoCore protocol pins (bidirectional, core-controlled OE)

   The chip is programmed over the SPI host interface, then [run] is asserted
   (CTRL command). uo_out[0] carries MISO while the host is talking; the UART,
   SPI and I2C demos drive uio[7:0]. *)

open Hardcaml

module I = struct
  type 'a t =
    { clk : 'a
    ; rst_n : 'a (* active low *)
    ; ui_in : 'a [@bits 8]
    ; uio_in : 'a [@bits 8]
    ; ena : 'a
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { uo_out : 'a [@bits 8]
    ; uio_out : 'a [@bits 8]
    ; uio_oe : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

let create ?(sram = false) (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let proto =
    Proto_top.create ~sram
      { Proto_top.I.clock = i.clk
      ; reset = ~:(i.rst_n)
      ; cs_n = bit i.ui_in 0
      ; sck = bit i.ui_in 1
      ; mosi = bit i.ui_in 2
      ; pins_in = i.uio_in
      ; test_enable = gnd
      }
  in
  { O.uo_out = select proto.pat_pins 7 2 @: proto.running @: proto.miso
  ; uio_out = proto.pins_out
  ; uio_oe = proto.oe
  }