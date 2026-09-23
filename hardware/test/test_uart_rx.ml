(* UART RX firmware test: drive an 8N1 waveform on pins_in[0], let the core
   sample and capture the bytes, then read them back from the buffer. *)

open Base
open Hardcaml
open Protocore

let () =
  let t = Test_util.create () in
  let bit_time = 100 in
  let buffer_addr = 0x20 in
  let bytes = [| Char.to_int 'A'; Char.to_int 'B'; Char.to_int 'C' |] in
  Test_util.load_program t (Programs.uart_rx_program ~buffer_addr ~bit_time);
  (* Build the UART waveform: idle high, then one 8N1 frame per byte. *)
  let total = (Array.length bytes * (10 * bit_time + 2 * bit_time)) + (3 * bit_time) in
  let wave = Array.create ~len:total 1 in
  let pos = ref (2 * bit_time) in
  Array.iter bytes ~f:(fun b ->
      let put bit =
        for i = 0 to bit_time - 1 do
          wave.(!pos + i) <- bit
        done;
        pos := !pos + bit_time
      in
      put 0 (* start *)
      ;
      for k = 0 to 7 do
        put ((b lsr k) land 1) (* data, LSB first *)
      done;
      put 1 (* stop *)
      ;
      (* idle gap so the firmware's per-byte reverse/store can resync *)
      put 1);
  (* Run the core, replaying the waveform onto pins_in[0]. *)
  t.inputs.test_enable := Bits.of_int ~width:1 1;
  for i = 0 to total - 1 do
    t.inputs.pins_in := Bits.of_int ~width:8 wave.(i);
    Cyclesim.cycle t.sim
  done;
  (* Let it finish the last frame and idle. *)
  t.inputs.pins_in := Bits.of_int ~width:8 1;
  Test_util.cycle t (3 * bit_time);
  t.inputs.test_enable := Bits.of_int ~width:1 0;
  Test_util.cycle t 2;
  let got = Array.init (Array.length bytes) ~f:(fun k -> Test_util.data_read t (buffer_addr + k)) in
  if not (Array.equal Int.equal got bytes) then begin
    Stdio.print_endline
      (Printf.sprintf "UART RX mismatch: got [%s] expected [%s]"
         (String.concat ~sep:";" (Array.to_list got |> List.map ~f:(Printf.sprintf "0x%02x")))
         (String.concat ~sep:";" (Array.to_list bytes |> List.map ~f:(Printf.sprintf "0x%02x"))));
    Stdlib.exit 1
  end;
  Stdio.print_endline
    (Printf.sprintf "PASS: UART RX captured %d bytes at 0x%02x over the host-programmed core"
       (Array.length got) buffer_addr)