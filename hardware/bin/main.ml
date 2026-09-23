(* Generates the Tiny Tapeout Verilog from the Hardcaml design.

   Writes ../src/project.v, which is what info.yaml source_files points at. *)

open Hardcaml
open Protocore

let output_file = "../src/project.v"

let () =
  let module C = Circuit.With_interface (Top.I) (Top.O) in
  let circuit = C.create_exn ~name:"tt_um_protocore" (Top.create ~sram:true) in
  Rtl.output
    ~output_mode:(Rtl.Output_mode.To_file output_file)
    Rtl.Language.Verilog circuit;
  Printf.printf "Wrote %s\n%!" output_file