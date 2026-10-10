(* JTAG master firmware against a behavioural IEEE 1149.1 TAP model (16-state
   FSM, IDCODE as the default DR). TDO changes on TCK falling edges, as on real
   silicon, and the master must recover the IDCODE and finish in Run-Test/Idle. *)

open Base
open Hardcaml
open Protocore

let idcode = 0x1BA00477
let half = 8

type st =
  | Reset | Idle | SelDR | CapDR | ShDR | Ex1DR | PauDR | Ex2DR | UpdDR
  | SelIR | CapIR | ShIR | Ex1IR | PauIR | Ex2IR | UpdIR

let next s tms =
  match s, tms with
  | Reset, 1 -> Reset | Reset, _ -> Idle
  | Idle, 1 -> SelDR | Idle, _ -> Idle
  | SelDR, 1 -> SelIR | SelDR, _ -> CapDR
  | CapDR, 1 -> Ex1DR | CapDR, _ -> ShDR
  | ShDR, 1 -> Ex1DR | ShDR, _ -> ShDR
  | Ex1DR, 1 -> UpdDR | Ex1DR, _ -> PauDR
  | PauDR, 1 -> Ex2DR | PauDR, _ -> PauDR
  | Ex2DR, 1 -> UpdDR | Ex2DR, _ -> ShDR
  | UpdDR, 1 -> SelDR | UpdDR, _ -> Idle
  | SelIR, 1 -> Reset | SelIR, _ -> CapIR
  | CapIR, 1 -> Ex1IR | CapIR, _ -> ShIR
  | ShIR, 1 -> Ex1IR | ShIR, _ -> ShIR
  | Ex1IR, 1 -> UpdIR | Ex1IR, _ -> PauIR
  | PauIR, 1 -> Ex2IR | PauIR, _ -> PauIR
  | Ex2IR, 1 -> UpdIR | Ex2IR, _ -> ShIR
  | UpdIR, 1 -> SelDR | UpdIR, _ -> Idle

let () =
  let t = Test_util.create () in
  let out_addr = 0x40 in
  Test_util.load_program t (Programs.jtag_idcode_program ~out_addr ~half);
  Test_util.ctrl t ~run:true;
  let state = ref Idle and dr = ref 0 and tdo = ref 0 in
  let prev_tck = ref 0 in
  for _ = 1 to 12_000 do
    let pins = Bits.to_int !(Test_util.(t.outputs).pins_out) in
    let tck = pins land 1 and tms = (pins lsr 1) land 1 in
    if tck = 1 && !prev_tck = 0 then begin
      (match !state with
       | CapDR -> dr := idcode
       | ShDR -> dr := !dr lsr 1
       | _ -> ());
      state := next !state tms
    end
    else if tck = 0 && !prev_tck = 1 then
      tdo := (match !state with ShDR -> !dr land 1 | _ -> 0);
    prev_tck := tck;
    t.inputs.pins_in := Bits.of_int ~width:8 (!tdo lsl 3);
    Cyclesim.cycle t.sim
  done;
  Test_util.ctrl t ~run:false;
  Test_util.cycle t 2;
  let got = ref 0 in
  for b = 3 downto 0 do
    got := (!got lsl 8) lor Test_util.data_read t (out_addr + b)
  done;
  if !got <> idcode then
    failwith (Printf.sprintf "JTAG IDCODE mismatch: got %08x expected %08x" !got idcode);
  (match !state with Idle -> () | _ -> failwith "TAP not left in Run-Test/Idle");
  Stdio.print_endline (Printf.sprintf "PASS: JTAG master read IDCODE %08x and returned TAP to Idle" !got)
