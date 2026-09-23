(* ProtoCore assembler.

   Programs are written as a list of [line] records where branches may use
   symbolic [Label] targets. Labels are resolved in a second pass. The result
   is a [program_size]-word image ready to load via the host interface.

   [delay_cycles] emits a sequence of DELAY instructions that consumes exactly
   the requested number of core cycles, exploiting the ISA timing contract
   (DELAY imm = imm+1 cycles). This is what lets firmware hit bit timing
   precisely. *)

open Base

type line =
  { label : string option
  ; insn : Isa.insn
  }

let label (l : string) (insn : Isa.insn) : line = { label = Some l; insn }
let i (insn : Isa.insn) : line = { label = None; insn }

let assemble ?(program_size = 256) (lines : line list) : int array =
  (* Pass 1: assign an address to each instruction and collect labels. *)
  let labels = ref [] in
  List.iteri lines ~f:(fun addr { label; _ } ->
      match label with
      | Some l -> labels := (l, addr) :: !labels
      | None -> ());
  if List.length lines > program_size then
    failwith (Printf.sprintf "program of %d instructions exceeds program memory %d"
                (List.length lines) program_size);
  (* Pass 2: encode. *)
  let labels = !labels in
  let image = Array.create ~len:program_size 0 in
  List.iteri lines ~f:(fun addr { insn; _ } ->
      image.(addr) <- Isa.enc labels insn);
  image

(* Emit a pure delay of exactly [cycles] core cycles (>= 1). *)
let delay_cycles (cycles : int) : Isa.insn list =
  if cycles < 1 then invalid_arg "delay_cycles: need >= 1 cycle";
  let rec go remaining acc =
    if remaining <= 0 then acc
    else if remaining >= 256 then go (remaining - 256) (Isa.Delay 255 :: acc)
    else go 0 (Isa.Delay (remaining - 1) :: acc)
  in
  List.rev (go cycles [])

(* Human-readable listing. *)
let listing (image : int array) : string =
  Array.to_list image
  |> List.mapi ~f:(fun addr w -> Printf.sprintf "%3d: %s" addr (Isa.disasm w))
  |> String.concat ~sep:"\n"