(* Test harness: a bit-banged SPI host driving Proto_top through the real
   host interface (the same path an external MCU would use), plus helpers for
   sampling pins. *)

open Base
open Hardcaml
open Protocore

module Sim = Cyclesim.With_interface (Proto_top.I) (Proto_top.O)

type t =
  { sim : (Bits.t ref Proto_top.I.t, Bits.t ref Proto_top.O.t) Cyclesim.t
  ; inputs : Bits.t ref Proto_top.I.t
  ; outputs : Bits.t ref Proto_top.O.t
  }

let half = 4

let create () =
  let sim = Sim.create Proto_top.create in
  let inputs = Cyclesim.inputs sim in
  let outputs = Cyclesim.outputs sim in
  let t = { sim; inputs; outputs } in
  t.inputs.reset := Bits.of_int ~width:1 1;
  t.inputs.cs_n := Bits.of_int ~width:1 1;
  t.inputs.sck := Bits.of_int ~width:1 0;
  t.inputs.mosi := Bits.of_int ~width:1 0;
  t.inputs.pins_in := Bits.of_int ~width:8 0;
  t.inputs.test_enable := Bits.of_int ~width:1 0;
  for _ = 1 to 10 do
    Cyclesim.cycle sim
  done;
  t.inputs.reset := Bits.of_int ~width:1 0;
  for _ = 1 to 5 do
    Cyclesim.cycle sim
  done;
  t

let cycle t n = for _ = 1 to n do Cyclesim.cycle t.sim done

(* [cs] = 1 when the chip is selected (cs_n driven low). *)
let drive t ~cs ~sck ~mosi =
  t.inputs.cs_n := Bits.of_int ~width:1 (1 - cs);
  t.inputs.sck := Bits.of_int ~width:1 sck;
  t.inputs.mosi := Bits.of_int ~width:1 mosi

let deassert t =
  drive t ~cs:0 ~sck:0 ~mosi:0;
  cycle t 2

let sck_cycle t ~cs ~mosi =
  drive t ~cs ~sck:0 ~mosi;
  cycle t half;
  drive t ~cs ~sck:1 ~mosi;
  cycle t half

let send_byte t ~cs byte =
  for bit = 7 downto 0 do
    sck_cycle t ~cs ~mosi:((byte lsr bit) land 1)
  done

let read_byte t ~cs =
  (* The slave presents MSB immediately after the command byte (SCK is high);
     it then advances one bit per SCK falling edge. Sample MSB first, then
     clock 7 more times sampling after each rising edge. *)
  let acc = ref 0 in
  let sample () =
    let b = Bits.to_int !(t.outputs.miso) land 1 in
    acc := (!acc lsl 1) lor b
  in
  sample ();
  for _ = 1 to 7 do
    drive t ~cs ~sck:0 ~mosi:0;
    cycle t half;
    drive t ~cs ~sck:1 ~mosi:0;
    cycle t half;
    sample ()
  done;
  !acc

let prog_addr t addr =
  send_byte t ~cs:1 0x01;
  send_byte t ~cs:1 ((addr lsr 8) land 0xff);
  send_byte t ~cs:1 (addr land 0xff);
  deassert t

let prog_data t word =
  send_byte t ~cs:1 0x02;
  send_byte t ~cs:1 ((word lsr 8) land 0xff);
  send_byte t ~cs:1 (word land 0xff);
  deassert t

let data_addr t addr =
  send_byte t ~cs:1 0x03;
  send_byte t ~cs:1 addr;
  deassert t

let data_write t byte =
  send_byte t ~cs:1 0x04;
  send_byte t ~cs:1 byte;
  deassert t

let data_read t addr =
  data_addr t addr;
  send_byte t ~cs:1 0x05;
  let v = read_byte t ~cs:1 in
  deassert t;
  v

let ctrl t ~run =
  send_byte t ~cs:1 0x06;
  send_byte t ~cs:1 (if run then 1 else 0);
  deassert t

let load_program t (image : int array) =
  prog_addr t 0;
  Array.iter image ~f:(prog_data t)

let load_data t (data : int array) =
  data_addr t 0;
  Array.iter data ~f:(data_write t)

let load_data_at t ~addr (data : int array) =
  data_addr t addr;
  Array.iter data ~f:(data_write t)

let cap_set t ~base ~ctrl =
  send_byte t ~cs:1 0x0A;
  send_byte t ~cs:1 base;
  send_byte t ~cs:1 ctrl;
  deassert t

let pat_set t ~base ~len ~ctrl =
  send_byte t ~cs:1 0x0B;
  send_byte t ~cs:1 base;
  send_byte t ~cs:1 len;
  send_byte t ~cs:1 ctrl;
  deassert t

let pat_data t ~idx ~pins ~dur =
  send_byte t ~cs:1 0x0C;
  send_byte t ~cs:1 idx;
  send_byte t ~cs:1 pins;
  send_byte t ~cs:1 dur;
  deassert t

(* Sample [pins_out] over [n] cycles, starting after [warmup] cycles. *)
let sample_pins t ~n : int array =
  let s = Array.create ~len:n 0 in
  for i = 0 to n - 1 do
    Cyclesim.cycle t.sim;
    s.(i) <- Bits.to_int !(t.outputs.pins_out) land 0xff
  done;
  s

let sample_pin t ~pin ~n : int array =
  Array.map (sample_pins t ~n) ~f:(fun v -> (v lsr pin) land 1)

let pin_of v pin = (v lsr pin) land 1