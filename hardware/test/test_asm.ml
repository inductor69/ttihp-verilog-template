(* Assembler unit tests: encoding round-trips and exact delay emission. *)

open Base
open Protocore

let () =
  (* delay_cycles burns exactly the requested number of cycles *)
  let cost = function
    | Isa.Delay imm -> imm + 1
    | _ -> 1
  in
  List.iter [ 1; 2; 7; 255; 256; 257; 5208; 65535 ] ~f:(fun n ->
      let seq = Asm.delay_cycles n in
      let total = List.sum (module Int) seq ~f:cost in
      if total <> n then begin
        Stdio.print_endline (Printf.sprintf "delay_cycles %d = %d" n total);
        Stdlib.exit 1
      end);
  Stdio.print_endline "PASS: delay_cycles exact for all tested lengths"

let () =
  (* encode/disasm round-trip on a representative program *)
  let image =
    Asm.assemble
      [ Asm.label "top" (Isa.Ldi (Isa.A, 42))
      ; Asm.i (Isa.Addi (Isa.A, 1))
      ; Asm.i (Isa.Delay 5)
      ; Asm.i (Isa.Jnz (Isa.Label "top"))
      ; Asm.i (Isa.Setpin (3, 1))
      ; Asm.i (Isa.Outs 0)
      ]
  in
  if not (String.equal (Isa.disasm image.(0)) "ldi a,0x2a") then begin
    Stdio.print_endline (Printf.sprintf "unexpected disasm: %s" (Isa.disasm image.(0)));
    Stdlib.exit 1
  end;
  (* branch target resolved to 0 *)
  if image.(3) land 0xff <> 0 then begin
    Stdio.print_endline "branch target not resolved";
    Stdlib.exit 1
  end;
  Stdio.print_endline "PASS: assembler label resolution and encoding"