(* Pattern sequencer test: load a {pins, duration} table and verify the
   sequencer streams it onto the pins with the exact dwell times. *)

open Base
open Hardcaml

let () =
  let t = Test_util.create () in
  let entries = [| 0x01, 50; 0x02, 30; 0x04, 20 |] in
  Array.iteri entries ~f:(fun i (pins, dur) -> Test_util.pat_data t ~idx:i ~pins ~dur);
  Test_util.pat_set t ~base:0 ~len:(Array.length entries) ~ctrl:0x01 (* enable *)
  ;
  Test_util.cycle t 2;
  let n = 600 in
  let pat = Array.init n ~f:(fun _ -> Bits.to_int !(t.outputs.pat_pins) land 0xff) in
  (* run lengths of each pin value *)
  let runs = ref [] in
  let cur = ref pat.(0) and len = ref 1 in
  for i = 1 to n - 1 do
    if pat.(i) = !cur then Int.incr len
    else begin
      runs := (!cur, !len) :: !runs;
      cur := pat.(i);
      len := 1
    end
  done;
  runs := (!cur, !len) :: !runs;
  let runs = List.rev !runs in
  let body = List.drop runs 1 in
  let expected_dwell = [| 50; 30; 20; 50; 30; 20; 50; 30 |] in
  let ok = ref true in
  List.iteri (List.take body 8) ~f:(fun i (pins, dur) ->
      let exp = expected_dwell.(i) in
      let exp_pins = match Int.rem i 3 with 0 -> 0x01 | 1 -> 0x02 | _ -> 0x04 in
      if dur <> exp || pins <> exp_pins then begin
        Stdio.print_endline (Printf.sprintf "run %d: pins=%02x dur=%d expected pins=%02x dur=%d"
                               i pins dur exp_pins exp);
        ok := false
      end);
  if not !ok then begin
    Stdio.print_endline ("runs: " ^ String.concat ~sep:" " (List.map runs ~f:(fun (v,l) -> Printf.sprintf "%02x:%d" v l)));
    Stdlib.exit 1
  end;
  Stdio.print_endline "PASS: pattern sequencer streams {pins,duration} entries with exact dwell times"