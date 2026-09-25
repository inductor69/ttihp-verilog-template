(* End-to-end host/core FIFO test through the SPI command decoder. *)

open Base
open Protocore

let () =
  let t = Test_util.create () in
  let program =
    Asm.assemble ~program_size:256
      [ Asm.label "loop" Isa.Pull
      ; Asm.i Isa.Push
      ; Asm.i (Isa.Jmp (Isa.Label "loop"))
      ]
  in
  Test_util.load_program t program;
  let bytes = [ 0x00; 0x5a; 0xa5; 0xff ] in
  List.iter bytes ~f:(Test_util.fifo_push t);
  Test_util.ctrl t ~run:true;
  Test_util.cycle t 100;
  Test_util.ctrl t ~run:false;
  let got = List.map bytes ~f:(fun _ -> Test_util.fifo_pop t) in
  if not (List.equal Int.equal got bytes) then begin
    Stdio.eprintf "FIFO got [%s], expected [%s]\n"
      (String.concat ~sep:";" (List.map got ~f:(Printf.sprintf "%02x")))
      (String.concat ~sep:";" (List.map bytes ~f:(Printf.sprintf "%02x")));
    Stdlib.exit 1
  end;
  Stdio.print_endline "PASS: SPI host RX/TX FIFOs round-trip four bytes"
