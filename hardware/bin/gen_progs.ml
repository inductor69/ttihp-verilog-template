(* Generates the firmware program images used by the Tiny Tapeout cocotb
   testbench: the UART TX program (9600 baud @ 50 MHz) and its message. *)

open Base
open Protocore

let () =
  let message = "Hello, ProtoCore! " in
  let bit_time = 50_000_000 / 9_600 in
  let msg_addr = 0x10 in
  let image =
    Programs.uart_tx_program ~msg_addr ~nbytes:(String.length message) ~bit_time
  in
  let dir = "../data" in
  Stdlib.Sys.command (Printf.sprintf "mkdir -p %s" dir) |> ignore;
  let prog = Stdio.Out_channel.create (dir ^ "/uart_tx.hex") in
  Array.iter image ~f:(fun w ->
      Stdio.Out_channel.output_string prog (Printf.sprintf "%04x\n" w));
  Stdio.Out_channel.close prog;
  let msg = Stdio.Out_channel.create (dir ^ "/message.hex") in
  String.iter message ~f:(fun c ->
      Stdio.Out_channel.output_string msg (Printf.sprintf "%02x\n" (Char.to_int c)));
  Stdio.Out_channel.close msg;
  Stdio.print_endline
    (Printf.sprintf "Wrote %s/uart_tx.hex (%d words, bit_time=%d) and %s/message.hex (%d bytes)"
       dir (Array.length image) bit_time dir (String.length message))