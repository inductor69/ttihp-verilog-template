(* CPU unit tests: arithmetic, data memory round-trip through the host, and
   DELAY timing measured on a pin. *)

open Base
open Protocore

let test_arithmetic () =
  let t = Test_util.create () in
  Test_util.load_program t (Programs.arithmetic_program ());
  Test_util.ctrl t ~run:true;
  Test_util.cycle t 200;
  Test_util.ctrl t ~run:false;
  let d0 = Test_util.data_read t 0 in
  let d1 = Test_util.data_read t 1 in
  let d2 = Test_util.data_read t 2 in
  if not (Int.equal d0 3 && Int.equal d1 0xe0 && Int.equal d2 0xe4) then begin
    Stdio.print_endline
      (Printf.sprintf "arithmetic mismatch: data=(0x%02x,0x%02x,0x%02x) expected (3,e0,e4)"
         d0 d1 d2);
    Stdlib.exit 1
  end;
  Stdio.print_endline "PASS: arithmetic, branches, flags, data memory round-trip"

let count_run_length (s : int array) ~target =
  let first = ref (-1) in
  let len = ref 0 in
  let best = ref 0 in
  Array.iteri s ~f:(fun i v ->
      if v = target then begin
        if !first < 0 then first := i;
        Int.incr len
      end
      else begin
        if !len > !best then best := !len;
        len := 0
      end);
  if !len > !best then best := !len;
  (!first, !best)

let test_delay_timing () =
  let t = Test_util.create () in
  let d = 50 in
  Test_util.load_program t (Programs.blink_program ~d);
  Test_util.ctrl t ~run:true;
  let s = Test_util.sample_pin t ~pin:0 ~n:500 in
  let first, high = count_run_length s ~target:1 in
  (* first high run is the first blink after startup; expect d+1 = 51 cycles *)
  if high <> d + 1 then begin
    Stdio.print_endline
      (Printf.sprintf "delay timing: measured high run %d cycles, expected %d" high (d + 1));
    Stdlib.exit 1
  end;
  Stdio.print_endline
    (Printf.sprintf "PASS: DELAY is cycle-exact (measured %d-cycle pulse at first=%d)" high first)

let () =
  test_arithmetic ();
  test_delay_timing ()