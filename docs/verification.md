# Verification approach

All RTL is generated from Hardcaml (`hardware/lib`). Verification is layered so
that each layer checks something the others cannot.

| Layer | Command | What it checks |
|---|---|---|
| Unit tests | `make sim` | Assembler encoding and label resolution, exact `DELAY` cost, ALU/branch/flags, FIFOs, capture engine, pattern sequencer |
| Protocol tests | `make sim` | Firmware run on the real core through the real SPI host path: UART TX/RX, SPI mode 0 (TX-only and full duplex), open-drain I2C with clock stretching and ACK, JTAG IDCODE read against a behavioural 1149.1 TAP model, SWD DPIDR read against a behavioural SW-DP model (also checks the line-reset/switch sequence, SWDIO release for turnaround, ACK and parity), low-speed USB token TX against an independent decoder (bit-grid exactness, NRZI, stuffing rules, SYNC, PID check nibble, CRC5 residual, EOP, and the canonical SETUP 0/0 bytes `2D 00 10`; mutation-checked) |
| Differential random test | `make sim` | 64 constrained-random programs x 3000 cycles; RTL and the cycle-accurate software model (`ref_model.ml`) must agree on pc, all registers, pins, output enables and cycle counter every cycle, and on all 256 data bytes at the end. Input pins are random each cycle and pass through the same 2-flop synchroniser delay as the RTL |
| Formal | `make formal` | SymbiYosys bounded proofs and covers on the byte FIFO (no overflow/underflow, ordering, simultaneous push/pop) |
| System | `make cocotb`, `make cocotb-icarus` | The emitted Verilog with the real IHP SRAM behavioural models, loaded over SPI, transmitting UART text decoded by the testbench |
| Physical | Tiny Tapeout GDS action, `docs/synthesis.md` | DRC, LVS, antenna, STA at three corners, precheck |

## What the random test found

Widening the differential test from 8 to 64 seeds with random pins found a real
RTL bug: a halted core stopped on an `LD`/`LDY` kept ownership of the data
memory read port, so host readback of data memory returned wrong data. It also
found a reference-model bug (`SHR` by a count of 8 or more). Both are fixed and
the seeds are now permanent regression tests.

## SRAM build vs flop build

Cyclesim cannot instantiate the IHP SRAM macros, so the differential test runs
the flop-memory build. CI's 4-state Icarus run exposed that the SRAM build was
not equivalent (an unread macro output is X and the fetch address depended on
it; instruction 0 ran twice; pausing on a taken branch lost the in-flight
instruction). A `valid` bit now forces a NOP on the first enabled cycle, as the
flop build's `ir` reset does. `make cocotb-icarus` reproduces the CI 4-state
run locally.

## Known gaps

- The differential test runs the flop-memory build; the SRAM-macro build cannot
  be simulated in Cyclesim and is covered only by the cocotb system test.
- Formal coverage is limited to the FIFO. The core is verified by simulation.
- Host-port and capture/pattern interactions are covered by directed tests, not
  by random stimulus.
