(* UART TX firmware test: load the program + message through the host SPI
   interface, run the core, and decode the 8N1 frames off the pin. *)

open Base
open Protocore

let bit_time = 120
let message = "Hi!"

let () =
  let t = Test_util.create () in
  let msg_addr = 0x10 in
  Test_util.load_program t (Programs.uart_tx_program ~bit_time ~msg_addr ~nbytes:(String.length message));
  Test_util.load_data_at t ~addr:msg_addr (Array.of_list (String.to_list message |> List.map ~f:Char.to_int));
  Test_util.ctrl t ~run:true;
  let n = (String.length message * 10 * bit_time) + 2000 in
  let s = Test_util.sample_pin t ~pin:0 ~n in
  (* UART decode, mid-bit sampling *)
  let find_start from =
    let rec go i =
      if i >= Array.length s then None
      else if s.(i) = 0 && s.(i - 1) = 1 then Some i
      else go (i + 1)
    in
    go (Int.max 1 from)
  in
  let read_byte start =
    let bit k = s.(start + ((k + 1) * bit_time) + (bit_time / 2)) in
    List.init 8 ~f:(fun k -> bit k)
    |> List.foldi ~init:0 ~f:(fun k acc b -> acc lor (b lsl k))
  in
  let got = ref [] and pos = ref 0 in
  for _ = 1 to String.length message do
    match find_start !pos with
    | None -> failwith "missing start bit"
    | Some start ->
      let byte = read_byte start in
      pos := start + (10 * bit_time);
      got := byte :: !got
  done;
  let got = List.rev !got in
  let expected = String.to_list message |> List.map ~f:Char.to_int in
  if not (List.equal Int.equal got expected) then begin
    Stdio.print_endline
      (Printf.sprintf "UART mismatch: got [%s], expected [%s]"
         (String.concat ~sep:";" (List.map got ~f:(Printf.sprintf "0x%02x")))
         (String.concat ~sep:";" (List.map expected ~f:(Printf.sprintf "0x%02x"))));
    Stdlib.exit 1
  end;
  Stdio.print_endline (Printf.sprintf "PASS: UART TX decoded %S over the host-programmed core"
                         message)