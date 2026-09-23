(* Pattern sequencer: streams {pins, duration} entries onto the output pins
   with no CPU involvement. Great for clocks and repetitive waveforms
   (e.g. WS2812, PS/2, IR), leaving the core free.

   The table lives in 16 internal 16-bit registers, loaded by the host:
       [7:0]   = pins to drive
       [15:8]  = duration in cycles (0 = 256)
   The sequencer drives each entry's pins for its duration, then advances to
   the next entry, wrapping around [len] entries. *)

open Base
open Hardcaml
open Always

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; enable : 'a
    ; len : 'a [@bits 8]
    ; table_wr : 'a
    ; table_idx : 'a [@bits 4]
    ; table_lo : 'a [@bits 8]
    ; table_hi : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { pins_out : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

let table_size = 16

let create (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.reset () in
  let tbl = Array.init table_size ~f:(fun _ -> Always.Variable.reg spec ~width:16) in
  let idx = Always.Variable.reg spec ~width:4 in
  let cnt = Always.Variable.reg spec ~width:8 in
  let en_prev = Always.Variable.reg spec ~width:1 in
  let entry = mux idx.value (Array.to_list (Array.map tbl ~f:(fun r -> r.value))) in
  let dur = select entry 15 8 in
  let pins = select entry 7 0 in
  let next_idx = mux2 (idx.value ==: select (i.len -:. 1) 3 0) (zero 4) (idx.value +:. 1) in
  let table_writes =
    proc
      (List.init table_size ~f:(fun k ->
           when_ (i.table_wr &: (i.table_idx ==:. k)) [ tbl.(k) <-- (i.table_hi @: i.table_lo) ]))
  in
  compile
    [ table_writes
    ; en_prev <-- i.enable
    ; when_ i.enable
        [ if_ (~:(en_prev.value))
            [ idx <--. 0; cnt <--. 1 ]
            [ if_ (cnt.value ==: dur)
                [ idx <-- next_idx; cnt <--. 1 ]
                [ cnt <-- cnt.value +:. 1 ]
            ]
        ]
    ];
  { O.pins_out = pins -- "pat_pins"
  }