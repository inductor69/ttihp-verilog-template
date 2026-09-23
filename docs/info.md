<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# ProtoCore

A tiny, cycle-counted programmable protocol engine for Tiny Tapeout.

ProtoCore is a general-purpose protocol emulator: a ~1-cycle-per-instruction
8-bit CPU whose instruction set is tuned for bit-banging (direct pin read/write,
a shift register, a free-running cycle counter, and exact-cost delays). UART,
SPI and I2C are implemented in firmware loaded over a SPI host interface, so
new protocols can be supported after fabrication. RTL is generated from
OCaml/Hardcaml (`hardware/`).

## How it works

**Architecture.** The chip is a Harvard 8-bit core:

- Program memory 256 x 16 and data memory 256 x 8 (SRAM).
- Registers A, X, Y, PINS, OE, SHIFT, SR, TMP plus a 16-bit free-running cycle
  counter. Flags Z and C (carry, also set by shifts).
- Instructions are 16-bit: 5-bit opcode, 3-bit register/pin, 8-bit immediate.
  Every instruction takes exactly one cycle except `DELAY` (imm+1),
  `WAITCYC`/`WAITPIN` (variable) and `PUSH`/`PULL` (stall on FIFO).
  The assembler exploits this to emit bit-exact timing.
- A free-running cycle counter and `WAITCYC` give absolute-time scheduling:
  programs can phase-lock waveforms instead of accumulating relative jitter.
- 8 bidirectional protocol pins (uio[7:0]) with per-pin output-enable, plus a
  mode-0 SPI host interface (CSn=ui[0], SCK=ui[1], MOSI=ui[2], MISO=uo[0]).
- A **pattern sequencer** (uo[7:2]) streams {pins, duration} waveforms from
  data memory with no CPU involvement (clocks, WS2812, IR...).
- An **edge-timestamp capture engine** (a mini logic analyzer) records
  {pins, 16-bit timestamp} records into data memory on configured edges,
  so the chip can sniff a bus while also running a protocol.

**Host interface.** An external host loads the firmware and starts the core:
commands for program/data memory load (auto-increment), run control, status,
byte FIFOs for host <-> core data exchange, and capture/pattern configuration
(CAP_SET 0x0A, PAT_SET 0x0B).

**Firmware.** `hardware/lib/programs.ml` contains UART 8N1 TX (with a software
bit-reverse for LSB-first order), an SPI master, and an I2C master, all written
in the ProtoCore assembler with cycle-exact timing.

## Area

Rough pre-ASIC estimate (Hardcaml `report_util` + Yosys synthesis):

- Registers: 381 bits (~385 flops).
- SRAM: 256 x 16 program + 256 x 8 data = 6 Kbit (2 macros; the area-efficient
  choice — as flip-flops this would be ~49k gate-equivalents).
- Logic (technology-independent Yosys): ~30k cells / ~50k gate-equivalents,
  dominated by the ALU/datapath multiplexers.

A 6x4 tile gives ~0.7 mm2, which should accommodate this, but the definitive
answer is the IHP PDK synthesis + P&R via the Tiny Tapeout GDS action (runs on
every push). Run the local proxy with `make area`.

## How to test

1. Hold CSn high, reset, then bit-bang SPI to load the UART TX firmware
   (see `hardware/data/uart_tx.hex`) and the message into data memory.
2. Send the run command.
3. The chip transmits `Hello, ProtoCore! ` at 9600 baud 8N1 on `uio[0]`.

Automated: `make rtl` regenerates the Verilog from Hardcaml, `make sim` runs the
OCaml cycle-accurate tests (UART/SPI/I2C + assembler + core), `make cocotb`
runs the Tiny Tapeout testbench, which programs the chip over SPI and decodes
the transmitted message.

## External hardware

A USB-UART adapter connected to `uio[0]`, plus a host MCU or USB adapter to
bit-bang the SPI programming interface.