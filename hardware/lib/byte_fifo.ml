(* 8-deep, 8-bit synchronous FIFO used for the host <-> core byte channels. *)

open Base
open Hardcaml

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; push : 'a
    ; push_data : 'a [@bits 8]
    ; pop : 'a
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { full : 'a
    ; empty : 'a
    ; data : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

let depth = 8
let ptr_w = 3

let create (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.reset () in
  let mem = Array.init depth ~f:(fun _ -> Always.Variable.reg spec ~width:8) in
  let wr = Always.Variable.reg spec ~width:ptr_w in
  let rd = Always.Variable.reg spec ~width:ptr_w in
  let count = Always.Variable.reg spec ~width:4 in
  let full = count.value ==:. depth in
  let empty = count.value ==:. 0 in
  let data = mux rd.value (Array.to_list (Array.map mem ~f:(fun m -> m.value))) -- "fifo_data" in
  let open Always in
  compile
    [ when_ (i.push &: ~:full)
        [ proc (List.init depth ~f:(fun k -> when_ (wr.value ==:. k) [ mem.(k) <-- i.push_data ]))
        ; wr <-- wr.value +:. 1
        ; count <-- count.value +:. 1
        ]
    ; when_ (i.pop &: ~:empty) [ rd <-- rd.value +:. 1; count <-- count.value -:. 1 ]
    ];
  { O.full = full -- "fifo_full"
  ; empty = empty -- "fifo_empty"
  ; data
  }