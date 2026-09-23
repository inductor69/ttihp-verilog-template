(* Constrained-random differential testing: run a random program on both the
   RTL (Cyclesim) and the cycle-accurate software reference model, comparing
   pc, the full register file, pins, output-enables and the cycle counter on
   every cycle, plus the whole data memory at the end. *)

open Base
open Hardcaml
open Protocore

let n_cycles = 3_000

let random_program (rng : Random.State.t) : int array =
  let insn () =
    (* any opcode except PULL (0x1D) which would stall forever against an
       empty RX FIFO; also avoid WAITPIN that waits for pin=1 (pins only go 0
       in the harness) to keep programs making progress *)
    let op =
      let rec pick () =
        let o = Random.State.int rng 0x20 in
        if o = 0x1D then pick () else o
      in
      pick ()
    in
    let arg = Random.State.int rng 8 in
    let imm = Random.State.int rng 0x100 in
    (op lsl 11) lor (arg lsl 8) lor imm
  in
  Array.init 256 ~f:(fun _ -> insn ())

let () =
  let seeds = List.init 8 ~f:(fun i -> 0x5000 + i) in
  let total_cycles = ref 0 in
  List.iter seeds ~f:(fun seed ->
      let rng = Random.State.make [| seed |] in
      let prog = random_program rng in
      let t = Test_util.create () in
      Test_util.load_program t prog;
      let r = Ref_model.create ~prog () in
      (* Aligned start: enable both at the same cycle from the post-reset state. *)
      t.inputs.test_enable := Bits.of_int ~width:1 1;
      r.enabled <- true;
      let mismatches = ref 0 in
      for i = 0 to n_cycles - 1 do
        let pins_in = (i * 5) land 0xff in
        t.inputs.pins_in := Bits.of_int ~width:8 pins_in;
        Cyclesim.cycle t.sim;
        Ref_model.step r ~pins_in;
        let pc_s = Bits.to_int !(t.outputs.pc) in
        let regs_s = Bits.to_int !(t.outputs.regs) in
        let pins_s = Bits.to_int !(t.outputs.pins_out) in
        let oe_s = Bits.to_int !(t.outputs.oe) in
        let cyc_s = Bits.to_int !(t.outputs.cyc) in
        let regs_r = Ref_model.regs_packed r in
        if pc_s <> r.pc || regs_s <> regs_r || pins_s <> (Ref_model.pins_out r)
           || oe_s <> (Ref_model.oe r) || cyc_s <> r.cyc
        then begin
          if !mismatches < 3 then begin
            Stdio.print_endline
              (Printf.sprintf "MISMATCH @ seed %d cycle %d (pins_in=%02x)\n  sim: pc=%02x regs=%016x pins=%02x oe=%02x cyc=%04x\n  ref: pc=%02x regs=%016x pins=%02x oe=%02x cyc=%04x"
                 seed i pins_in pc_s regs_s pins_s oe_s cyc_s r.pc regs_r
                 (Ref_model.pins_out r) (Ref_model.oe r) r.cyc);
            if pc_s <> r.pc then
              Stdio.print_endline (Printf.sprintf "  insn sim=%s ref=%s"
                                     (Isa.disasm (prog.(pc_s))) (Isa.disasm (prog.(r.pc))))
          end;
          Int.incr mismatches
        end
      done;
      if !mismatches > 0 then begin
        Stdio.print_endline (Printf.sprintf "FAIL: seed %d, %d mismatched cycles" seed !mismatches);
        Stdlib.exit 1
      end;
      (* Compare data memory: halt the core, read back via the host interface. *)
      t.inputs.test_enable := Bits.of_int ~width:1 0;
      Test_util.cycle t 2;
      let mem_mismatch = ref 0 in
      for a = 0 to 255 do
        let v = Test_util.data_read t a in
        if v <> r.data.(a) then begin
          if !mem_mismatch < 3 then
            Stdio.print_endline
              (Printf.sprintf "DATA mismatch @ seed %d addr %02x: sim=%02x ref=%02x" seed a v r.data.(a));
          Int.incr mem_mismatch
        end
      done;
      if !mem_mismatch > 0 then begin
        Stdio.print_endline (Printf.sprintf "FAIL: seed %d, %d data memory mismatches" seed !mem_mismatch);
        Stdlib.exit 1
      end;
      total_cycles := !total_cycles + (n_cycles * 256));
  Stdio.print_endline
    (Printf.sprintf "PASS: RTL matches the reference model for %d random programs x %d cycles (incl. data memory)"
       (List.length seeds) n_cycles)