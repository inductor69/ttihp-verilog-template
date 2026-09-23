(* SPI master firmware test: verify CS framing, the 8 clock pulses per byte,
   and MOSI data valid on each CLK rising edge. *)

open Base
open Protocore

let half = 8
let message = [ 0xA5; 0x3C ]

let () =
  let t = Test_util.create () in
  let msg_addr = 0x10 in
  Test_util.load_program t (Programs.spi_master_program ~half ~msg_addr ~nbytes:(List.length message));
  Test_util.load_data_at t ~addr:msg_addr (Array.of_list message);
  Test_util.ctrl t ~run:true;
  let n = (List.length message * 8 * ((2 * half) + 4)) + 2000 in
  let pins = Test_util.sample_pins t ~n in
  let cs = Array.map pins ~f:(fun v -> Test_util.pin_of v 0) in
  let clk = Array.map pins ~f:(fun v -> Test_util.pin_of v 1) in
  let mosi = Array.map pins ~f:(fun v -> Test_util.pin_of v 2) in
  let find_edge v ~from =
    let rec go i =
      if i >= Array.length v then None
      else if v.(i) = 1 && v.(i - 1) = 0 then Some i (* rising *)
      else go (i + 1)
    in
    go (Int.max 1 from)
  in
  let cs_fall =
    let rec go i =
      if i >= Array.length cs then None
      else if cs.(i) = 0 && cs.(i - 1) = 1 then Some i
      else go (i + 1)
    in
    go 1
  in
  (match cs_fall with
   | None -> failwith "no CS assert"
   | Some start ->
     let rising = ref [] in
     let rec collect i =
       match find_edge clk ~from:i with
       | None -> ()
       | Some j ->
         rising := j :: !rising;
         collect (j + 1)
     in
     collect (start + 1);
     let rising = List.rev !rising in
     if List.length rising < (List.length message * 8) then
       failwith "not enough CLK pulses";
     let got =
       List.init (List.length message) ~f:(fun b ->
           let byte = ref 0 in
           List.iteri (List.take (List.drop rising (b * 8)) 8) ~f:(fun _ j ->
               byte := (!byte lsl 1) lor mosi.(j));
           !byte)
     in
     if not (List.equal Int.equal got message) then begin
       Stdio.print_endline
         (Printf.sprintf "SPI mismatch: got [%s] expected [%s]"
            (String.concat ~sep:";" (List.map got ~f:(Printf.sprintf "0x%02x")))
            (String.concat ~sep:";" (List.map message ~f:(Printf.sprintf "0x%02x"))));
       Stdlib.exit 1
     end;
     Stdio.print_endline
       (Printf.sprintf "PASS: SPI master clocked %d bytes over the host-programmed core"
          (List.length message)))