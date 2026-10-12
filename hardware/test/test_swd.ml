(* SWD master firmware against a behavioural SW-DP model.  The model checks the
   line reset and the JTAG-to-SWD switch sequence, recognises the DPIDR read
   request, then drives turnaround / ACK / data / parity on SWDIO after SWCLK
   rising edges (as a real target does).  SWDIO is a shared pad: the host drives
   it only while its output-enable is set, the target otherwise, and a pull-up
   makes it read 1 when nobody drives. *)

open Base
open Hardcaml
open Protocore

let dpidr = 0x2BA01477
let half = 8

let parity v =
  let rec go v acc = if v = 0 then acc else go (v lsr 1) (acc lxor (v land 1)) in
  go v 0

let () =
  let t = Test_util.create () in
  let out_addr = 0x40 in
  Test_util.load_program t (Programs.swd_dpidr_program ~out_addr ~half);
  Test_util.ctrl t ~run:true;
  let target : int option ref = ref None in
  let prev_clk = ref 0 in
  let ones = ref 0 and saw_reset = ref false in
  let w8 = ref 0 and w16 = ref 0 and saw_switch = ref false in
  let resp : int option ref = ref None in
  let finished = ref false and violations = ref 0 in
  for _ = 1 to 40_000 do
    let pins = Bits.to_int !(t.outputs.pins_out) in
    let oe = Bits.to_int !(t.outputs.oe) in
    let clk = pins land 1 in
    let host_drives = (oe lsr 1) land 1 = 1 in
    let pad =
      if host_drives then (pins lsr 1) land 1
      else (match !target with Some v -> v | None -> 1)
    in
    if clk = 1 && !prev_clk = 0 then begin
      (match !resp with
       | None ->
         if not host_drives then Int.incr violations (* floating before request *);
         if pad = 1 then (Int.incr ones; if !ones >= 50 then saw_reset := true)
         else ones := 0;
         w8 := (!w8 lsr 1) lor (pad lsl 7);
         w16 := (!w16 lsr 1) lor (pad lsl 15);
         if !saw_reset && !w16 = 0xE79E then saw_switch := true;
         if !saw_switch && !w8 = 0xA5 then resp := Some 0
       | Some k ->
         if k = 0 && host_drives then Int.incr violations (* must release for turnaround *);
         target :=
           (if k = 0 then None
            else if k <= 3 then Some (if k = 1 then 1 else 0)
            else if k <= 35 then Some ((dpidr lsr (k - 4)) land 1)
            else if k = 36 then Some (parity dpidr)
            else None);
         if k >= 37 then (resp := None; finished := true; saw_switch := false)
         else resp := Some (k + 1))
    end;
    prev_clk := clk;
    t.inputs.pins_in := Bits.of_int ~width:8 ((pad lsl 1) lor (clk lsl 0));
    Cyclesim.cycle t.sim
  done;
  Test_util.ctrl t ~run:false;
  Test_util.cycle t 2;
  let got = ref 0 in
  for b = 3 downto 0 do
    got := (!got lsl 8) lor Test_util.data_read t (out_addr + b)
  done;
  let ack = Test_util.data_read t (out_addr + 4) in
  let par = Test_util.data_read t (out_addr + 5) in
  if not !saw_reset then failwith "target never saw a line reset";
  if not !finished then failwith "target never saw a complete DPIDR read request";
  if !violations > 0 then failwith "bus contention / missing release detected";
  if ack <> 1 then failwith (Printf.sprintf "ACK %d, expected 1 (OK)" ack);
  if !got <> dpidr then failwith (Printf.sprintf "DPIDR %08x expected %08x" !got dpidr);
  if par <> parity dpidr then failwith "parity bit mismatch";
  Stdio.print_endline
    (Printf.sprintf "PASS: SWD master line-reset, JTAG-to-SWD switch, read DPIDR %08x (ACK OK, parity OK)" !got)
