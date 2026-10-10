(* A cycle-accurate software model of the ProtoCore CPU.

   Used for constrained-random differential testing against the RTL
   (Cyclesim). It mirrors core.ml's semantics exactly: the same stall rules,
   ALU/flag behaviour, register file, memory, pin writes and cycle counter.

   External inputs (pins, FIFO status) are supplied per step so the model can
   be driven identically to the hardware. *)

open Base
open Isa

type t =
  { prog : int array (* 256 x 16 *)
  ; mutable pc : int (* fetch pointer *)
  ; mutable ir : int (* instruction being executed (synchronous fetch) *)
  ; mutable regs : int array (* 8 x 8, indexed by Isa.reg_index *)
  ; mutable dly : int
  ; mutable ld_stall : int (* synchronous data read: LD/LDY take 2 cycles *)
  ; mutable cyc : int (* 16-bit *)
  ; mutable data : int array (* 256 x 8 *)
  ; mutable tx_count : int (* core -> host FIFO occupancy, models tx_full *)
  ; mutable enabled : bool
  }

let create ?(prog = Array.create ~len:256 0) () : t =
  { prog
  ; pc = 0
  ; ir = 0 (* reset ir = NOP *)
  ; regs = Array.create ~len:8 0
  ; dly = 0
  ; ld_stall = 0
  ; cyc = 0
  ; data = Array.create ~len:256 0
  ; tx_count = 0
  ; enabled = false
  }

let r r t = t.regs.(reg_index r)
let set_r r v t = t.regs.(reg_index r) <- v land 0xff

let insert_bit base idx v =
  let base = base land 0xff in
  let v = v land 1 in
  let mask = 1 lsl idx in
  (base land lnot mask) lor (if v = 1 then mask else 0)

(* One clock cycle. Mirrors core.ml's guarded-assignment behaviour. *)
let step t ~(pins_in : int) : unit =
  if not t.enabled then ()
  else begin
    let fifo_tx_full = t.tx_count >= 8 in
    let fifo_rx_empty = true and fifo_rx_data = 0 in
    let insn = t.ir in
    let op = (insn lsr 11) land 0x1f in
    let arg = (insn lsr 8) land 0x7 in
    let imm = insn land 0xff in
    let rv = t.regs.(arg) in
    let pin_bit p = (pins_in lsr p) land 1 in
    let z = t.regs.(reg_index SR) land 1 in
    let c = (t.regs.(reg_index SR) lsr 1) land 1 in
    (* Stall logic *)
    let ld_active = op = 0x1E || op = 0x0A in
    let advance =
      if op = 0x0D then t.dly = imm
      else if op = 0x0E then (t.cyc land 0xff) = imm
      else if op = 0x0F then pin_bit arg = (imm land 1)
      else if op = 0x1C then not fifo_tx_full
      else if op = 0x1D then not fifo_rx_empty
      else if ld_active then t.ld_stall = 1
      else true
    in
    let dly_next =
      if op = 0x0D then (if t.dly < imm then t.dly + 1 else 0) else 0
    in
    (* ALU *)
    let is_alu = op >= 3 && op <= 9 in
    let alu_sum = (rv + imm) land 0xff in
    let alu_carry = ((rv + imm) lsr 8) land 1 in
    let alu_diff = (rv - imm) land 0xff in
    let alu_borrow = if rv < imm then 1 else 0 in
    let shift_count = if imm = 0 then 8 else imm in
    let alu_shl = if shift_count >= 8 then 0 else (rv lsl shift_count) land 0xff in
    let alu_shr = if shift_count >= 8 then 0 else rv lsr shift_count in
    let alu_and = rv land imm in
    let alu_or = rv lor imm in
    let alu_xor = rv lxor imm in
    let alu_result, alu_cflag =
      match op with
      | 0x03 -> alu_sum, alu_carry
      | 0x04 -> alu_diff, alu_borrow
      | 0x05 -> alu_and, 0
      | 0x06 -> alu_or, 0
      | 0x07 -> alu_xor, 0
      | 0x08 -> alu_shl, (rv lsr 7) land 1
      | 0x09 -> alu_shr, rv land 1
      | _ -> 0, 0
    in
    let branch =
      match op with
      | 0x10 -> true
      | 0x11 -> z = 1
      | 0x12 -> z = 0
      | 0x13 -> c = 1
      | 0x14 -> c = 0
      | 0x15 -> pin_bit arg = 1
      | 0x16 -> pin_bit arg = 0
      | 0x17 -> ((t.regs.(reg_index X) - 1) land 0xff) <> 0
      | _ -> false
    in
    if advance then begin
      (* Fetch the next instruction from the branch target / fall-through. *)
      let fetch_addr = if branch then imm else t.pc in
      t.pc <- (fetch_addr + 1) land 0xff;
      t.ir <- t.prog.(fetch_addr);
      (* General register-file write: LDI/MOV/ALU/LD/LDY/IN/PININ/PULL *)
      let generic =
        op = 0x01 || op = 0x02 || is_alu || op = 0x1E || op = 0x0A || op = 0x18
        || op = 0x19 || op = 0x1D
      in
      if generic then begin
        let value =
          match op with
          | 0x01 -> imm
          | 0x02 -> t.regs.(imm land 0x7)
          | 0x1E | 0x0A ->
            let addr = if op = 0x0A then t.regs.(reg_index Y) else imm in
            t.data.(addr)
          | 0x18 -> pin_bit (imm land 0x7)
          | 0x19 -> pins_in
          | 0x1D -> fifo_rx_data
          | _ -> alu_result
        in
        t.regs.(arg) <- value land 0xff
      end;
      (* Special writes *)
      match op with
      | 0x0C ->
        t.regs.(reg_index PINS) <- insert_bit t.regs.(reg_index PINS) arg (imm land 1)
      | 0x1A ->
        t.regs.(reg_index PINS) <-
          insert_bit t.regs.(reg_index PINS) arg ((t.regs.(reg_index SHIFT) lsr 7) land 1);
        t.regs.(reg_index SHIFT) <- (t.regs.(reg_index SHIFT) lsl 1) land 0xff
      | 0x1B ->
        t.regs.(reg_index SHIFT) <-
          ((t.regs.(reg_index SHIFT) lsl 1) land 0xfe) lor pin_bit arg
      | 0x17 -> t.regs.(reg_index X) <- (t.regs.(reg_index X) - 1) land 0xff
      | _ -> ()
    end;
    (* Data memory writes (on advance) *)
    if advance then begin
      if op = 0x1F then t.data.(imm) <- rv;
      if op = 0x0B then t.data.(t.regs.(reg_index Y)) <- rv
    end;
    (* Flags for ALU ops *)
    if advance && ld_active then t.ld_stall <- 0
    else if ld_active && not advance then t.ld_stall <- 1;
    if advance && is_alu then
      t.regs.(reg_index SR) <- (alu_cflag lsl 1) lor (if alu_result = 0 then 1 else 0);
    if advance && op = 0x1C then t.tx_count <- t.tx_count + 1;
    (* Cycle bookkeeping *)
    t.dly <- dly_next land 0xff;
    t.cyc <- (t.cyc + 1) land 0xffff
  end

let regs_packed t =
  Array.fold t.regs ~init:0 ~f:(fun acc v -> (acc lsl 8) lor v)

let pins_out t = t.regs.(reg_index PINS)
let oe t = t.regs.(reg_index OE)