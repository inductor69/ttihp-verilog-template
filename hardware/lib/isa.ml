(* ProtoCore instruction set.

   16-bit instructions: [15:11] opcode (5b), [10:8] arg (3b: register or pin),
   [7:0] immediate (8b: value, address, or branch target).

   Registers (3-bit): A=0 X=1 Y=2 PINS=3 OE=4 SHIFT=5 SR=6 TMP=7.
   Flags in SR: bit0 = Z, bit1 = C.

   Timing contract: every instruction executes in exactly one core cycle,
   except DELAY (imm+1), WAITCYC/WAITPIN (variable, >=1) and PUSH/PULL which
   stall on full/empty FIFOs. The assembler's cycle model in Asm.delay_cycles
   exploits this to emit bit-exact timing. *)

open Base

type reg = A | X | Y | PINS | OE | SHIFT | SR | TMP

let all_regs = [ A; X; Y; PINS; OE; SHIFT; SR; TMP ]

let reg_index = function
  | A -> 0
  | X -> 1
  | Y -> 2
  | PINS -> 3
  | OE -> 4
  | SHIFT -> 5
  | SR -> 6
  | TMP -> 7

let reg_of_index = function
  | 0 -> A
  | 1 -> X
  | 2 -> Y
  | 3 -> PINS
  | 4 -> OE
  | 5 -> SHIFT
  | 6 -> SR
  | 7 -> TMP
  | _ -> invalid_arg "reg_of_index"

type target = Addr of int | Label of string

type insn =
  | Nop
  | Ldi of reg * int
  | Mov of reg * reg
  | Addi of reg * int
  | Subi of reg * int
  | Andi of reg * int
  | Ori of reg * int
  | Xori of reg * int
  | Shl of reg * int
  | Shr of reg * int
  | Setpins of int (* sugar: Ldi PINS, v *)
  | Setoe of int (* sugar: Ldi OE, v *)
  | Setpin of int * int (* pin, value *)
  | Ldy of reg (* r <- DATA[Y] *)
  | Sty of reg (* DATA[Y] <- r *)
  | Delay of int
  | Waitcyc of int
  | Waitpin of int * int (* pin, value *)
  | Jmp of target
  | Jz of target
  | Jnz of target
  | Jc of target
  | Jnc of target
  | Jb of int * target (* pin, target *)
  | Jnb of int * target
  | Decjnz of target
  | In of reg * int (* register, pin *)
  | Pinin of reg
  | Outs of int (* pin *)
  | Ins of int (* pin *)
  | Push
  | Pull
  | Ld of reg * int
  | St of reg * int

let opcode : insn -> int = function
  | Nop -> 0x00
  | Ldi _ -> 0x01
  | Mov _ -> 0x02
  | Addi _ -> 0x03
  | Subi _ -> 0x04
  | Andi _ -> 0x05
  | Ori _ -> 0x06
  | Xori _ -> 0x07
  | Shl _ -> 0x08
  | Shr _ -> 0x09
  | Setpins _ -> 0x01
  | Setoe _ -> 0x01
  | Setpin _ -> 0x0C
  | Ldy _ -> 0x0A
  | Sty _ -> 0x0B
  | Delay _ -> 0x0D
  | Waitcyc _ -> 0x0E
  | Waitpin _ -> 0x0F
  | Jmp _ -> 0x10
  | Jz _ -> 0x11
  | Jnz _ -> 0x12
  | Jc _ -> 0x13
  | Jnc _ -> 0x14
  | Jb _ -> 0x15
  | Jnb _ -> 0x16
  | Decjnz _ -> 0x17
  | In _ -> 0x18
  | Pinin _ -> 0x19
  | Outs _ -> 0x1A
  | Ins _ -> 0x1B
  | Push -> 0x1C
  | Pull -> 0x1D
  | Ld _ -> 0x1E
  | St _ -> 0x1F

(* Cycle cost of an instruction, for the assembler timing model.
   WAIT* are variable; callers must handle those explicitly. *)
let cycle_cost : insn -> int = function
  | Delay imm -> imm + 1
  | _ -> 1

(* Resolve a jump target to a plain address given a label map. *)
let resolve_target (labels : (string * int) list) : target -> int = function
  | Addr a -> a
  | Label l ->
    (match List.Assoc.find labels l ~equal:String.equal with
     | Some a -> a
     | None -> failwith (Printf.sprintf "unknown label %s" l))

let enc
    (labels : (string * int) list)
    (insn : insn) : int =
  let target_addr t = resolve_target labels t in
  let word op arg imm = (op lsl 11) lor (arg lsl 8) lor (imm land 0xff) in
  match insn with
  | Nop -> word 0x00 0 0
  | Ldi (r, v) -> word 0x01 (reg_index r) v
  | Mov (d, s) -> word 0x02 (reg_index d) (reg_index s)
  | Addi (r, v) -> word 0x03 (reg_index r) v
  | Subi (r, v) -> word 0x04 (reg_index r) v
  | Andi (r, v) -> word 0x05 (reg_index r) v
  | Ori (r, v) -> word 0x06 (reg_index r) v
  | Xori (r, v) -> word 0x07 (reg_index r) v
  | Shl (r, v) -> word 0x08 (reg_index r) v
  | Shr (r, v) -> word 0x09 (reg_index r) v
  | Setpins v -> word 0x01 (reg_index PINS) v
  | Setoe v -> word 0x01 (reg_index OE) v
  | Setpin (p, v) -> word 0x0C p v
  | Ldy r -> word 0x0A (reg_index r) 0
  | Sty r -> word 0x0B (reg_index r) 0
  | Delay v -> word 0x0D 0 v
  | Waitcyc v -> word 0x0E 0 v
  | Waitpin (p, v) -> word 0x0F p v
  | Jmp t -> word 0x10 0 (target_addr t)
  | Jz t -> word 0x11 0 (target_addr t)
  | Jnz t -> word 0x12 0 (target_addr t)
  | Jc t -> word 0x13 0 (target_addr t)
  | Jnc t -> word 0x14 0 (target_addr t)
  | Jb (p, t) -> word 0x15 p (target_addr t)
  | Jnb (p, t) -> word 0x16 p (target_addr t)
  | Decjnz t -> word 0x17 0 (target_addr t)
  | In (r, p) -> word 0x18 (reg_index r) p
  | Pinin r -> word 0x19 (reg_index r) 0
  | Outs p -> word 0x1A p 0
  | Ins p -> word 0x1B p 0
  | Push -> word 0x1C 0 0
  | Pull -> word 0x1D 0 0
  | Ld (r, a) -> word 0x1E (reg_index r) a
  | St (r, a) -> word 0x1F (reg_index r) a

let reg_name = function
  | A -> "a"
  | X -> "x"
  | Y -> "y"
  | PINS -> "pins"
  | OE -> "oe"
  | SHIFT -> "shift"
  | SR -> "sr"
  | TMP -> "tmp"

let mnemonic_of_opcode op = [| "nop"; "ldi"; "mov"; "addi"; "subi"; "andi"; "ori";
                              "xori"; "shl"; "shr"; "setpins"; "setoe"; "setpin";
                              "delay"; "waitcyc"; "waitpin"; "jmp"; "jz"; "jnz";
                              "jc"; "jnc"; "jb"; "jnb"; "decjnz"; "in"; "pinin";
                              "outs"; "ins"; "push"; "pull"; "ld"; "st" |].(op)

let disasm (word : int) : string =
  let op = (word lsr 11) land 0x1f in
  let arg = (word lsr 8) land 0x7 in
  let imm = word land 0xff in
  let m = mnemonic_of_opcode op in
  match op with
  | 0x00 | 0x1c | 0x1d -> m
  | 0x01 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09
  | 0x1e | 0x1f -> Printf.sprintf "%s %s,0x%02x" m (reg_of_index arg |> reg_name) imm
  | 0x02 -> Printf.sprintf "%s %s,%s" m (reg_name (reg_of_index arg)) (reg_name (reg_of_index (imm land 0x7)))
  | 0x0a | 0x0b | 0x0d | 0x0e | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x17 ->
    Printf.sprintf "%s 0x%02x" m imm
  | 0x0c | 0x0f | 0x15 | 0x16 | 0x1a | 0x1b ->
    Printf.sprintf "%s p%d,0x%02x" m arg imm
  | 0x18 -> Printf.sprintf "%s %s,p%d" m (reg_name (reg_of_index arg)) imm
  | 0x19 -> Printf.sprintf "%s %s" m (reg_name (reg_of_index arg))
  | _ -> Printf.sprintf "? 0x%04x" word