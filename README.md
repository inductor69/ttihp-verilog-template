# ProtoCore

ProtoCore is an open-source, firmware-programmable serial protocol engine for
the Jane Street/Tiny Tapeout IHP SG13G2 ASIC challenge. It is written in
OCaml/Hardcaml and emits the Verilog submitted to the ASIC flow.

Instead of fixed UART, SPI, and I2C peripherals, ProtoCore provides a compact
8-bit CPU whose instruction set directly supports GPIO, shifting, precise
delays, pin waits, cycle deadlines, and host FIFOs. New protocols can be loaded
after fabrication through a dedicated SPI host port.

## Implemented

- 256 x 16-bit program SRAM and 256 x 8-bit data SRAM using IHP macros
- Eight bidirectional protocol GPIOs with independent output enables
- 32-instruction, cycle-counted ISA and label-aware assembler
- SPI firmware/program loader and bidirectional byte FIFOs
- UART 8N1 transmitter and receiver firmware
- SPI mode-0 transmit-only and full-duplex master firmware
- Open-drain I2C master firmware with ACK sampling and clock-stretch support
- Timestamped edge-capture engine
- 16-entry autonomous pattern sequencer
- Cycle-accurate reference model and constrained-random differential tests
- SymbiYosys bounded proofs and covers for FIFO safety and simultaneous traffic
- SRAM-macro-backed cocotb system test of programming and UART transmission

The original push-pull I2C waveform demo is retained for comparison; the
open-drain implementation uses output-enable control and supports slave clock
stretching. Multi-master arbitration and the stretch protocols (USB, Ethernet,
CAN, JTAG, SWD, and PS/2) remain future work.

## Pin map

- `ui[0]`: host SPI CSn
- `ui[1]`: host SPI SCK
- `ui[2]`: host SPI MOSI
- `uo[0]`: host SPI MISO
- `uo[1]`: core running
- `uo[7:2]`: pattern sequencer outputs 7 through 2
- `uio[7:0]`: programmable bidirectional protocol GPIOs

## Build and test

The Hardcaml build requires an opam environment containing the dependencies in
`hardware/dune-project`. The cocotb test uses a local Python virtual environment.

```sh
make rtl          # regenerate src/project.v
make sim          # Hardcaml unit, protocol, and differential tests
make formal       # generate FIFO RTL and run SymbiYosys/Z3 properties
make cocotb-setup # one-time cocotb environment setup
make cocotb       # simulate the generated RTL with IHP SRAM models
make area         # generic Yosys logic-cell estimate, SRAMs black-boxed
```

See [the project datasheet](docs/info.md) for the architecture and host command
interface, and [the synthesis notes](docs/synthesis.md) for physical-design
status and earlier area results.

## License

Apache-2.0. See [LICENSE](LICENSE).
