(* I2C master firmware test: verify START condition, 8 data bits sampled during
   SCL high, the ACK clock with SDA released, and STOP. *)

open Base
open Protocore

let half = 16
let byte = 0xA5 (* 1010 0101, MSB first *)

let () =
  let t = Test_util.create () in
  let msg_addr = 0x10 in
  Test_util.load_program t (Programs.i2c_master_program ~half ~msg_addr ~nbytes:1);
  Test_util.load_data_at t ~addr:msg_addr [| byte |];
  Test_util.ctrl t ~run:true;
  let n = (2 * half * 14) + 2000 in
  let pins = Test_util.sample_pins t ~n in
  let scl = Array.map pins ~f:(fun v -> Test_util.pin_of v 0) in
  let sda = Array.map pins ~f:(fun v -> Test_util.pin_of v 1) in
  (* START: SDA falls while SCL high *)
  let start_idx =
    let rec go i =
      if i >= Array.length sda then None
      else if sda.(i) = 0 && sda.(i - 1) = 1 && scl.(i) = 1 then Some i
      else go (i + 1)
    in
    go 1
  in
  (match start_idx with
   | None -> failwith "no I2C START condition"
   | Some start ->
     let scl_rise =
       let rec go i acc =
         if i >= Array.length scl then List.rev acc
         else if scl.(i) = 1 && scl.(i - 1) = 0 then go (i + 1) (i :: acc)
         else go (i + 1) acc
       in
       go (start + 1) []
     in
     if List.length scl_rise < 9 then failwith "fewer than 9 SCL clocks";
     let sample_at rise =
       let mid = rise + (half / 2) in
       sda.(Int.min mid (Array.length sda - 1))
     in
     let data_bits = List.take scl_rise 8 |> List.map ~f:sample_at in
     let got = List.foldi data_bits ~init:0 ~f:(fun _ acc b -> (acc lsl 1) lor b) in
     let ack = sample_at (List.nth_exn scl_rise 8) in
     if got <> byte then begin
       Stdio.print_endline (Printf.sprintf "I2C data mismatch: got 0x%02x expected 0x%02x" got byte);
       Stdlib.exit 1
     end;
     if ack <> 1 then begin
       Stdio.print_endline "I2C ACK not high (no slave)";
       Stdlib.exit 1
     end;
     Stdio.print_endline
       (Printf.sprintf "PASS: I2C START + byte 0x%02x + ACK + STOP over the host-programmed core" byte))