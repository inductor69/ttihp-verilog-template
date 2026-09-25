open Base
open Hardcaml
open Protocore

let () =
  let t = Test_util.create () in
  let half = 6 in
  let addr = 0x40 in
  let byte = 0xa5 in
  Test_util.load_program t
    (Programs.i2c_master_open_drain_program ~msg_addr:addr ~nbytes:1 ~half);
  Test_util.load_data_at t ~addr [| byte |];
  Test_util.ctrl t ~run:true;
  let prev_scl = ref 1 in
  let prev_sda = ref 1 in
  let rises = ref 0 in
  let sampled = ref [] in
  let saw_start = ref false in
  let saw_stop = ref false in
  let saw_low_after_start = ref false in
  let stretch_left = ref 5 in
  let released_scl_cycles = ref 0 in
  for _ = 0 to 2999 do
    let oe = Bits.to_int !(t.outputs.oe) in
    let pins = Bits.to_int !(t.outputs.pins_out) in
    if pins <> 0 then
      failwith (Printf.sprintf "open-drain firmware drove pins=%02x at pc=%02x"
                  pins (Bits.to_int !(t.outputs.pc)));
    let scl_released = Test_util.pin_of oe 0 = 0 in
    let sda_released = Test_util.pin_of oe 1 = 0 in
    (* Stretch only the first released data clock. *)
    if !saw_start && not scl_released then saw_low_after_start := true;
    let stretch =
      scl_released && !rises = 0 && !saw_low_after_start && !stretch_left > 0
    in
    if stretch then Int.decr stretch_left;
    let slave_ack = !rises = 8 in
    let scl = if scl_released && not stretch then 1 else 0 in
    let sda = if sda_released && not slave_ack then 1 else 0 in
    if !prev_sda = 1 && sda = 0 && scl = 1 then saw_start := true;
    if !prev_sda = 0 && sda = 1 && scl = 1 && !rises >= 9 then saw_stop := true;
    if !prev_scl = 0 && scl = 1 then begin
      if !rises < 8 then sampled := sda :: !sampled;
      Int.incr rises
    end;
    if scl_released && scl = 0 then Int.incr released_scl_cycles;
    t.inputs.pins_in := Bits.of_int ~width:8 (scl lor (sda lsl 1));
    prev_scl := scl;
    prev_sda := sda;
    Cyclesim.cycle t.sim
  done;
  let got = List.rev !sampled |> List.fold ~init:0 ~f:(fun v bit -> (v lsl 1) lor bit) in
  if not !saw_start then failwith "missing open-drain START";
  if !rises < 9 then failwith "missing I2C data/ACK clocks";
  if not !saw_stop then failwith "missing open-drain STOP";
  if !released_scl_cycles < 5 then failwith "clock stretching was not exercised";
  if got <> byte then
    failwith (Printf.sprintf "I2C byte %02x, expected %02x (%s)" got byte
                (String.concat ~sep:"" (List.rev !sampled |> List.map ~f:Int.to_string)));
  Stdio.print_endline "PASS: open-drain I2C byte, ACK, STOP, and clock stretching"
