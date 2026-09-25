# ProtoCore - Tiny Tapeout design
#
# RTL is authored in OCaml/Hardcaml (hardware/) and emitted as plain Verilog
# (src/project.v). Two verification paths are available: the OCaml cycle-accurate
# sim (hardware/) and the Tiny Tapeout cocotb testbench (test/).
#
# The cocotb test uses a Python venv (.venv); create it once with:
#   python3 -m venv .venv && ./.venv/bin/pip install cocotb

VENV ?= .venv

.PHONY: rtl sim formal cocotb cocotb-setup all clean

# Regenerate src/project.v from the Hardcaml source
rtl:
	cd hardware && opam exec -- dune exec bin/main.exe

# Rough technology-independent area estimate via Yosys (memory macros will be
# much smaller than the flip-flop arrays Yosys synthesizes here)
area:
	cd hardware && opam exec -- dune exec bin/report_util.exe
	cd src && yosys -p "read_verilog -lib sram/RM_IHPSG13_1P_256x16_c2_bm_bist.v sram/RM_IHPSG13_2P_256x8_c2_bm_bist.v; read_verilog project.v; synth -top tt_um_inductor69_protocore; stat" 2>/dev/null | sed -n '/Printing statistics/,$$p' | grep -E "cells|RM_IHP|_DFF|_SDFF|_MUX|_NAND|_AND |_AND_|_OR |_OR_|_XOR|_NOT"

# Run the OCaml cycle-accurate tests (Hardcaml Cyclesim)
sim:
	cd hardware && opam exec -- dune runtest --force

formal:
	cd hardware && opam exec -- dune exec bin/formal_fifo.exe
	cd formal && sby -f fifo.sby

# Set up the cocotb Python environment
cocotb-setup:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip cocotb

# Run the Tiny Tapeout cocotb testbench on the emitted Verilog (Verilator)
cocotb:
	cd test && PATH="$(CURDIR)/$(VENV)/bin:$$PATH" make -B SIM=verilator

all: rtl sim

clean:
	cd hardware && dune clean
	cd test && make clean
