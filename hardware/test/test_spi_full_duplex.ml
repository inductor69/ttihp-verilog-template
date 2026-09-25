open Base
open Hardcaml
open Protocore

let () =
  let t = Test_util.create () in
  let half = 8 in
  let addr = 0x30 in
  let tx = [| 0xa5; 0x3c |] in
  let rx = [| 0x5a; 0xc3 |] in
  Test_util.load_program t
    (Programs.spi_master_full_duplex_program
       ~buffer_addr:addr ~nbytes:(Array.length tx) ~half);
  Test_util.load_data_at t ~addr tx;
  Test_util.ctrl t ~run:true;
  let previous_clk = ref 0 in
  let bit_index = ref 0 in
  let sampled_mosi = ref [] in
  for _ = 0 to 4999 do
    let pins = Bits.to_int !(t.outputs.pins_out) in
    let clk = Test_util.pin_of pins 1 in
    if clk = 1 && !previous_clk = 0 && !bit_index < Array.length rx * 8 then begin
      sampled_mosi := Test_util.pin_of pins 2 :: !sampled_mosi;
    end;
    if clk = 0 && !previous_clk = 1 && !bit_index < Array.length rx * 8 then
      Int.incr bit_index;
    let next_bit =
      if !bit_index >= Array.length rx * 8 then 0
      else
        let byte = rx.(!bit_index / 8) in
        (byte lsr (7 - Int.rem !bit_index 8)) land 1
    in
    t.inputs.pins_in := Bits.of_int ~width:8 (next_bit lsl 3);
    previous_clk := clk;
    Cyclesim.cycle t.sim
  done;
  Test_util.ctrl t ~run:false;
  let got_rx = Array.init (Array.length rx) ~f:(fun k -> Test_util.data_read t (addr + k)) in
  let got_tx =
    List.rev !sampled_mosi
    |> List.chunks_of ~length:8
    |> List.map ~f:(List.fold ~init:0 ~f:(fun v bit -> (v lsl 1) lor bit))
    |> Array.of_list
  in
  if not (Array.equal Int.equal got_tx tx) then failwith "SPI full-duplex MOSI mismatch";
  if not (Array.equal Int.equal got_rx rx) then begin
    Stdio.eprintf "SPI RX got [%s], expected [%s]\n"
      (String.concat ~sep:";" (Array.to_list got_rx |> List.map ~f:(Printf.sprintf "%02x")))
      (String.concat ~sep:";" (Array.to_list rx |> List.map ~f:(Printf.sprintf "%02x")));
    Stdlib.exit 1
  end;
  Stdio.print_endline "PASS: SPI mode-0 full-duplex transmit and receive"
