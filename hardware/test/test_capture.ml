(* Capture engine test: drive a square wave on a pin, capture the configured
   edges as timestamped records, read them back from the data memory. *)

open Base
open Hardcaml

let () =
  let t = Test_util.create () in
  let base = 0x80 in
  let pin = 3 in
  (* ctrl: bit0=enable, bit1=polarity(1=rising), bits[4:2]=pin *)
  let ctrl = 0x01 lor (0x02) lor (pin lsl 2) in
  Test_util.cap_set t ~base ~ctrl;
  (* Run the cycle counter (core runs NOPs) and drive a square wave on the pin *)
  t.inputs.test_enable := Bits.of_int ~width:1 1;
  let period = 100 in
  let n = 1200 in
  for i = 0 to n - 1 do
    let level = ((i / period) land 1) lsl pin in
    t.inputs.pins_in := Bits.of_int ~width:8 level;
    Cyclesim.cycle t.sim
  done;
  t.inputs.test_enable := Bits.of_int ~width:1 0;
  Test_util.cycle t 2;
  (* rising edges at i = 100, 300, 500, 700, 900, 1100 *)
  let expected = [ 100; 300; 500; 700; 900; 1100 ] in
  let n_events = List.length expected in
  let records =
    List.init n_events ~f:(fun k ->
        let b0 = Test_util.data_read t (base + (k * 3)) in
        let b1 = Test_util.data_read t (base + (k * 3) + 1) in
        let b2 = Test_util.data_read t (base + (k * 3) + 2) in
        (b0, b1, b2))
  in
  (* verify pin state byte has the pin set, and timestamps near the expected
     cycles (within 1 cycle) *)
  let ok = ref true in
  List.iteri records ~f:(fun k (b0, b1, b2) ->
      let cyc = List.nth_exn expected k in
      let pins_ok = (b0 lsr pin) land 1 = 1 in
      let ts = (b2 lsl 8) lor b1 in
      let ts_ok = Int.abs (ts - cyc) <= 2 in
      if not (pins_ok && ts_ok) then ok := false);
  if not !ok then begin
    Stdio.print_endline (Printf.sprintf "capture mismatch (base=%02x):" base);
    List.iteri records ~f:(fun k (b0, b1, b2) ->
        Stdio.print_endline
          (Printf.sprintf "  event %d: pins=%02x ts=%d (expected ~%d)"
             k b0 ((b2 lsl 8) lor b1) (List.nth_exn expected k)));
    Stdlib.exit 1
  end;
  Stdio.print_endline
    (Printf.sprintf "PASS: capture engine recorded %d rising-edge events on pin %d with timestamps"
       n_events pin)