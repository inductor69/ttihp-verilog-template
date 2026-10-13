(* Low-speed USB token transmitter.  The firmware computes the PID check nibble
   and CRC5 on-chip, then serialises SYNC/PID/ADDR/ENDP/CRC5 with NRZI and bit
   stuffing at 33 cycles per bit.  This test is an independent USB decoder: it
   watches D+/D-, requires every line transition to land on the bit grid
   (exact, no jitter), NRZI-decodes, checks bit-stuffing rules, SYNC, the PID
   check nibble, the CRC5 residual, the EOP (SE0 SE0 J) and finally compares the
   fields and, for the well-known SETUP 0/0 token, the raw bytes 2D 00 10. *)

open Base
open Hardcaml
open Protocore

let bit_cycles = 33

type line = J | K | SE0 | Z

let line_of pins oe =
  if oe land 3 = 0 then Z
  else
    match pins land 3 with
    | 2 -> J (* D+ low, D- high: low-speed idle *)
    | 1 -> K
    | 0 -> SE0
    | _ -> failwith "illegal line state D+=D-=1"

let crc5_residual bits =
  List.fold bits ~init:0x1f ~f:(fun crc b ->
      let t = ((crc lsr 4) land 1) lxor b in
      let crc = (crc lsl 1) land 0x1f in
      if t = 1 then crc lxor 0x05 else crc)

let equal_line_ a b = Poly.equal a b

let run ~pid ~addr ~endp =
  let t = Test_util.create () in
  Test_util.load_program t (Programs.usb_ls_token_program ());
  Test_util.load_data_at t ~addr:0 [| pid; addr; endp |];
  Test_util.ctrl t ~run:true;
  let n = 4000 in
  let trace = Array.create ~len:n Z in
  for c = 0 to n - 1 do
    Cyclesim.cycle t.sim;
    trace.(c) <- line_of (Bits.to_int !(t.outputs.pins_out)) (Bits.to_int !(t.outputs.oe))
  done;
  (* first K = start of SYNC bit 0 *)
  let t0 =
    let rec go c = if c >= n then failwith "no SYNC seen" else if equal_line_ trace.(c) K then c else go (c + 1) in
    go 1
  in
  (* every transition must be on the bit grid *)
  let eop_start = ref (-1) in
  for c = t0 + 1 to n - 1 do
    if !eop_start < 0 && not (equal_line_ trace.(c) trace.(c - 1)) then begin
      if (c - t0) % bit_cycles <> 0 then
        failwith (Printf.sprintf "edge at +%d is off the %d-cycle bit grid" (c - t0) bit_cycles);
      if equal_line_ trace.(c) SE0 then eop_start := c
    end
  done;
  if !eop_start < 0 then failwith "no EOP (SE0) seen";
  (* decode NRZI + destuff up to the SE0 *)
  let nbits = (!eop_start - t0) / bit_cycles in
  let prev = ref J and ones = ref 0 in
  let bits = ref [] in
  for k = 0 to nbits - 1 do
    let s = trace.(t0 + (k * bit_cycles) + (bit_cycles / 2)) in
    (match s with J | K -> () | _ -> failwith "SE0/Z inside packet");
    let b = if equal_line_ s !prev then 1 else 0 in
    prev := s;
    if !ones = 6 then begin
      if b <> 0 then failwith "bit-stuffing violation: seventh consecutive 1";
      ones := 0 (* stuffed bit, dropped *)
    end else begin
      bits := b :: !bits;
      ones := if b = 1 then !ones + 1 else 0
    end
  done;
  let bits = List.rev !bits in
  if List.length bits <> 32 then failwith (Printf.sprintf "expected 32 payload bits, got %d" (List.length bits));
  (* EOP: SE0 for 2 bit times, then J for 1 bit time *)
  let at k = trace.(!eop_start + k) in
  if not (equal_line_ (at 1) SE0 && equal_line_ (at ((2 * bit_cycles) - 1)) SE0) then failwith "SE0 shorter than 2 bit times";
  if not (equal_line_ (at ((2 * bit_cycles) + 2)) J && equal_line_ (at ((3 * bit_cycles) - 2)) J) then failwith "EOP not followed by J";
  let byte_of l = List.foldi l ~init:0 ~f:(fun k acc b -> acc lor (b lsl k)) in
  let bytes = List.init 4 ~f:(fun k -> byte_of (List.sub bits ~pos:(8 * k) ~len:8)) in
  let sync, pidb, b2, b3 = match bytes with [ a; b; c; d ] -> a, b, c, d | _ -> assert false in
  if sync <> 0x80 then failwith "bad SYNC";
  if (pidb land 0xf) lxor 0xf <> pidb lsr 4 then failwith "PID check nibble wrong";
  if pidb land 0xf <> pid then failwith "wrong PID";
  if List.length (List.filter (List.sub bits ~pos:16 ~len:16) ~f:(fun _ -> true)) <> 16 then failwith "len";
  let res = crc5_residual (List.sub bits ~pos:16 ~len:16) in
  if res <> 0x0c then failwith (Printf.sprintf "CRC5 residual %02x, expected 0c" res);
  let a = b2 land 0x7f and e = ((b2 lsr 7) land 1) lor ((b3 land 7) lsl 1) in
  if a <> addr || e <> endp then failwith (Printf.sprintf "fields addr=%x endp=%x, expected %x %x" a e addr endp);
  (bytes, nbits)

let () =
  (* SETUP, address 0, endpoint 0: the canonical token bytes are 2D 00 10 *)
  let bytes, _ = run ~pid:0xD ~addr:0 ~endp:0 in
  (match bytes with
   | [ 0x80; 0x2d; 0x00; 0x10 ] -> ()
   | l -> failwith (String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x"))));
  (* all-ones heavy fields force bit stuffing *)
  let _, n = run ~pid:0x1 ~addr:0x7f ~endp:0xf in
  if n <= 32 then failwith "expected stuffed bits on the wire";
  let _, _ = run ~pid:0x9 ~addr:0x3a ~endp:0x5 in
  let _, _ = run ~pid:0xD ~addr:0x15 ~endp:0xa in
  Stdio.print_endline
    "PASS: USB low-speed token TX (on-chip CRC5/PID, NRZI, bit stuffing, jitter-free 33-cycle bits, EOP)"
