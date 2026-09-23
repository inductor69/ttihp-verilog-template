(* Edge-timestamp capture engine (a mini logic analyzer).

   When enabled, watches the 8 protocol pins for the configured edge on the
   configured pin (or any pin). On each matching edge it writes a 3-byte record
   to the shared data memory at [base + ptr]:
       byte 0 : pin state (8 bits)
       byte 1 : cycle counter low byte
       byte 2 : cycle counter high byte
   The pointer auto-increments by 3 and wraps. The host reads the records back
   through the host interface, turning the chip into a protocol sniffer. *)

open Base
open Hardcaml
open Always

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; enable : 'a
    ; polarity : 'a (* 1 = rising edge, 0 = falling *)
    ; pin : 'a [@bits 3] (* pin to watch (if any = 0) *)
    ; any : 'a (* 1 = trigger on any pin *)
    ; base : 'a [@bits 8]
    ; pins_in : 'a [@bits 8]
    ; cyc : 'a [@bits 16]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { wr : 'a (* data memory write enable *)
    ; wr_addr : 'a [@bits 8]
    ; wr_data : 'a [@bits 8]
    ; ptr : 'a [@bits 8] (* byte offset from the capture base *)
    }
  [@@deriving sexp_of, hardcaml]
end

(* 3-cycle write sequence per event: [pins], [cyc_lo], [cyc_hi]. *)
let write_cycles = 3

let create (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.reset () in
  let prev = Always.Variable.reg spec ~width:8 in
  let ptr = Always.Variable.reg spec ~width:8 in
  let seq = Always.Variable.reg spec ~width:2 in
  let active = Always.Variable.reg spec ~width:1 in
  (* edge detection on the configured pin / any pin *)
  let pin_edge =
    List.init 8 ~f:(fun p ->
        let rising = bit i.pins_in p &: ~:(bit prev.value p) in
        let falling = ~:(bit i.pins_in p) &: bit prev.value p in
        mux2 i.polarity rising falling)
  in
  let trigger =
    mux2 i.any
      (List.fold pin_edge ~init:gnd ~f:(fun acc e -> acc |: e))
      (mux i.pin pin_edge)
  in
  let idle = ~:(active.value) in
  let start_cap = i.enable &: idle &: trigger in
  let wr_en = active.value in
  let byte_sel = select seq.value 1 0 in
  let wr_addr =
    mux byte_sel
      [ i.base +: ptr.value
      ; i.base +: ptr.value +:. 1
      ; i.base +: ptr.value +:. 2
      ]
  in
  let wr_data =
    mux byte_sel
      [ i.pins_in
      ; select i.cyc 7 0
      ; select i.cyc 15 8
      ]
  in
  compile
    [ prev <-- i.pins_in
    ; when_ (i.enable &: idle)
        [ when_ start_cap [ active <--. 1; seq <--. 0 ]
        ]
    ; when_ wr_en
        [ if_ (seq.value ==:. 2)
            [ active <--. 0; ptr <-- ptr.value +:. write_cycles ]
            [ seq <-- seq.value +:. 1 ]
        ]
    ];
  { O.wr = wr_en
  ; wr_addr = wr_addr
  ; wr_data = wr_data
  ; ptr = ptr.value
  }