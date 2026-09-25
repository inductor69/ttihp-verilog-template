open Hardcaml
open Protocore

let () =
  let module C = Circuit.With_interface (Byte_fifo.I) (Byte_fifo.O) in
  let circuit = C.create_exn ~name:"protocore_byte_fifo" Byte_fifo.create in
  Rtl.output
    ~output_mode:(Rtl.Output_mode.To_file "../formal/byte_fifo.v")
    Rtl.Language.Verilog circuit
