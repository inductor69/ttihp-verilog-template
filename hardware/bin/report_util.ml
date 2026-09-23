(* Prints a resource-utilization report (registers, gates, memories) for the
   ProtoCore top as an area proxy before running the ASIC flow. *)

open Hardcaml
open Protocore

let () =
  let module C = Circuit.With_interface (Top.I) (Top.O) in
  let circuit = C.create_exn ~name:"tt_um_protocore" Top.create in
  let util = Circuit_utilization.create circuit in
  Stdio.print_s ([%sexp_of: Circuit_utilization.t] util)