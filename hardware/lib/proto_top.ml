(* ProtoCore top level: core + host interface + FIFOs.

   Cross-module connections are made through explicit wires so the feedback
   paths (core <-> FIFO status, host <-> core) can be closed after all modules
   are constructed. *)

open Hardcaml

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a (* active high *)
    ; cs_n : 'a
    ; sck : 'a
    ; mosi : 'a
    ; pins_in : 'a [@bits 8]
    ; test_enable : 'a (* direct core enable for testbench use *)
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { miso : 'a
    ; pins_out : 'a [@bits 8]
    ; oe : 'a [@bits 8]
    ; running : 'a
    ; pc : 'a [@bits 8]
    ; cyc : 'a [@bits 16]
    ; regs : 'a [@bits 64]
    ; cap_ptr : 'a [@bits 8]
    ; pat_pins : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

let create ?(sram = false) (i : Signal.t I.t) : Signal.t O.t =
  let open Signal in
  (* Inter-module wires *)
  let w n width = wire width -- n in
  let core_data_out = w "core_data_out" 8 in
  let core_tx_push = w "core_tx_push" 1 in
  let core_tx_data = w "core_tx_data" 8 in
  let core_rx_pop = w "core_rx_pop" 1 in
  let host_run = w "host_run" 1 in
  let host_reset_core = w "host_reset_core" 1 in
  let host_prog_wr = w "host_prog_wr" 1 in
  let host_prog_wr_addr = w "host_prog_wr_addr" 8 in
  let host_prog_wr_data = w "host_prog_wr_data" 16 in
  let host_data_wr = w "host_data_wr" 1 in
  let host_data_wr_addr = w "host_data_wr_addr" 8 in
  let host_data_wr_data = w "host_data_wr_data" 8 in
  let host_data_rd_addr = w "host_data_rd_addr" 8 in
  let host_tx_pop = w "host_tx_pop" 1 in
  let host_rx_push = w "host_rx_push" 1 in
  let host_rx_data = w "host_rx_data" 8 in
  let tx_full = w "tx_full" 1 in
  let tx_empty = w "tx_empty" 1 in
  let tx_data = w "tx_data" 8 in
  let rx_full = w "rx_full" 1 in
  let rx_empty = w "rx_empty" 1 in
  let rx_data = w "rx_data" 8 in
  let cap_wr = w "cap_wr" 1 in
  let cap_wr_addr = w "cap_wr_addr" 8 in
  let cap_wr_data = w "cap_wr_data" 8 in

  (* Core *)
  let core_out =
    Core.create ~sram
      { Core.I.clock = i.clock
      ; reset = i.reset |: host_reset_core
      ; enable = host_run |: i.test_enable
      ; pins_in = i.pins_in
      ; prog_wr = host_prog_wr
      ; prog_wr_addr = host_prog_wr_addr
      ; prog_wr_data = host_prog_wr_data
      ; data_wr = host_data_wr
      ; data_wr_addr = host_data_wr_addr
      ; data_wr_data = host_data_wr_data
      ; data_rd_addr = host_data_rd_addr
      ; cap_wr = cap_wr
      ; cap_wr_addr = cap_wr_addr
      ; cap_wr_data = cap_wr_data
      ; fifo_tx_full = tx_full
      ; fifo_rx_empty = rx_empty
      ; fifo_rx_data = rx_data
      }
  in
  (* Host SPI interface *)
  let host_out =
    Host.create
      { Host.I.clock = i.clock
      ; reset = i.reset
      ; cs_n = i.cs_n
      ; sck = i.sck
      ; mosi = i.mosi
      ; data_read = core_data_out
      ; fifo_tx_empty = tx_empty
      ; fifo_tx_data = tx_data
      ; fifo_rx_full = rx_full
      }
  in
  (* Byte FIFOs *)
  let tx_fifo =
    Byte_fifo.create
      { clock = i.clock
      ; reset = i.reset
      ; push = core_tx_push
      ; push_data = core_tx_data
      ; pop = host_tx_pop
      }
  in
  let rx_fifo =
    Byte_fifo.create
      { clock = i.clock
      ; reset = i.reset
      ; push = host_rx_push
      ; push_data = host_rx_data
      ; pop = core_rx_pop
      }
  in
  (* Capture engine: records {pins, timestamp} on configured edges *)
  let cap_out =
    Capture.create
      { Capture.I.clock = i.clock
      ; reset = i.reset
      ; enable = bit host_out.cap_ctrl 0
      ; polarity = bit host_out.cap_ctrl 1
      ; pin = select host_out.cap_ctrl 4 2
      ; any = bit host_out.cap_ctrl 5
      ; base = host_out.cap_base
      ; pins_in = i.pins_in
      ; cyc = core_out.cyc_out
      }
  in
  (* Pattern sequencer: streams {pins, duration} entries from data memory *)
  let pat_out =
    Pattern.create
      { Pattern.I.clock = i.clock
      ; reset = i.reset
      ; enable = bit host_out.pat_ctrl 0
      ; len = host_out.pat_len
      ; table_wr = host_out.pat_data_wr
      ; table_idx = host_out.pat_data_idx
      ; table_lo = host_out.pat_data_lo
      ; table_hi = host_out.pat_data_hi
      }
  in
  (* Close the wiring *)
  let () =
    assign core_data_out core_out.data_out;
    assign core_tx_push core_out.fifo_tx_push;
    assign core_tx_data core_out.fifo_tx_data;
    assign core_rx_pop core_out.fifo_rx_pop;
    assign host_run host_out.run;
    assign host_reset_core host_out.reset_core;
    assign host_prog_wr host_out.prog_wr;
    assign host_prog_wr_addr host_out.prog_wr_addr;
    assign host_prog_wr_data host_out.prog_wr_data;
    assign host_data_wr host_out.data_wr;
    assign host_data_wr_addr host_out.data_wr_addr;
    assign host_data_wr_data host_out.data_wr_data;
    assign host_data_rd_addr host_out.data_rd_addr;
    assign host_tx_pop host_out.fifo_tx_pop;
    assign host_rx_push host_out.fifo_rx_push;
    assign host_rx_data host_out.fifo_rx_data;
    assign tx_full tx_fifo.full;
    assign tx_empty tx_fifo.empty;
    assign tx_data tx_fifo.data;
    assign rx_full rx_fifo.full;
    assign rx_empty rx_fifo.empty;
    assign rx_data rx_fifo.data;
    assign cap_wr cap_out.wr;
    assign cap_wr_addr cap_out.wr_addr;
    assign cap_wr_data cap_out.wr_data
  in
  { O.miso = host_out.miso
  ; pins_out = core_out.pins_out
  ; oe = core_out.oe
  ; running = host_out.run
  ; pc = core_out.pc_out
  ; cyc = core_out.cyc_out
  ; regs = core_out.regs_out
  ; cap_ptr = cap_out.ptr
  ; pat_pins = pat_out.pins_out
  }