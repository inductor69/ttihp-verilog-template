# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

"""Programs the ProtoCore over its SPI host interface (loading the UART TX
firmware) then decodes the 8N1 frames it transmits on uio[0].

The design is genuinely reprogrammable: an external host bit-bangs the loader
(CSn=ui[0], SCK=ui[1], MOSI=ui[2]), the core then runs the loaded program.
"""

import os

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge

BAUD = 9600
CLOCK_HZ = 50_000_000
BIT_TIME = CLOCK_HZ // BAUD

DATA_DIR = os.path.join(os.path.dirname(__file__), "..", "data")


def read_hex(name):
    with open(os.path.join(DATA_DIR, name)) as f:
        return [int(line.strip(), 16) for line in f if line.strip()]


# --- SPI host driver ---------------------------------------------------------

SCK_HALF = 4


async def drive(dut, cs, sck, mosi):
    # ui[0]=CSn, ui[1]=SCK, ui[2]=MOSI; cs=1 means selected (CSn low)
    dut.ui_in.value = (mosi << 2) | (sck << 1) | (0 if cs else 1)


async def sck_cycle(dut, mosi):
    await drive(dut, cs=1, sck=0, mosi=mosi)
    await ClockCycles(dut.clk, SCK_HALF)
    await drive(dut, cs=1, sck=1, mosi=mosi)
    await ClockCycles(dut.clk, SCK_HALF)


async def send_byte(dut, byte):
    for bit in range(7, -1, -1):
        await sck_cycle(dut, (byte >> bit) & 1)


async def read_response_byte(dut):
    """Read the byte presented immediately after an output command."""
    value = int(dut.uo_out.value[0])
    for _ in range(7):
        await drive(dut, cs=1, sck=0, mosi=0)
        await ClockCycles(dut.clk, SCK_HALF)
        await drive(dut, cs=1, sck=1, mosi=0)
        await ClockCycles(dut.clk, SCK_HALF)
        value = (value << 1) | int(dut.uo_out.value[0])
    return value


async def deassert(dut):
    await drive(dut, cs=0, sck=0, mosi=0)
    await ClockCycles(dut.clk, 2)


async def cmd2(dut, command, lo, hi):
    await send_byte(dut, command)
    await send_byte(dut, hi)
    await send_byte(dut, lo)
    await deassert(dut)


async def load_program(dut, words):
    await cmd2(dut, 0x01, 0, 0)  # program address 0
    for w in words:
        await cmd2(dut, 0x02, w & 0xFF, (w >> 8) & 0xFF)


async def data_addr(dut, addr):
    await send_byte(dut, 0x03)
    await send_byte(dut, addr)
    await deassert(dut)


async def data_write(dut, byte):
    await send_byte(dut, 0x04)
    await send_byte(dut, byte)
    await deassert(dut)


async def load_data(dut, addr, bytes_):
    await data_addr(dut, addr)
    for b in bytes_:
        await data_write(dut, b)


async def data_read(dut, addr):
    await data_addr(dut, addr)
    await send_byte(dut, 0x05)
    value = await read_response_byte(dut)
    await deassert(dut)
    return value


async def set_run(dut, run):
    await send_byte(dut, 0x06)
    await send_byte(dut, 1 if run else 0)
    await deassert(dut)


# --- UART decode -------------------------------------------------------------

async def sample_tx(dut, count):
    samples = []
    for _ in range(count):
        await RisingEdge(dut.clk)
        samples.append(int(dut.uio_out.value[0]))
    return samples


def find_start(samples, start):
    for i in range(max(1, start), len(samples)):
        if samples[i] == 0 and samples[i - 1] == 1:
            return i
    return None


def read_byte(samples, start):
    byte = 0
    for k in range(8):
        byte |= samples[start + (k + 1) * BIT_TIME + BIT_TIME // 2] << k
    return byte


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, 20, unit="ns")  # 50 MHz
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0b1  # cs_n idle high (bit 0), sck/mosi low
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 5)

    # Program the core via the SPI host interface
    dut._log.info("Loading UART TX firmware over SPI")
    words = read_hex("uart_tx.hex")
    message = read_hex("message.hex")
    await load_program(dut, words)
    await load_data(dut, 0x10, message)
    readback = [await data_read(dut, 0x10 + i) for i in range(len(message))]
    assert readback == message, "SRAM data-memory host readback mismatch"
    # Start sampling before RUN is sent: the firmware can assert the UART
    # start bit only a few clocks after it is enabled.
    n = len(message) * 10 * BIT_TIME + 2500
    sample_task = cocotb.start_soon(sample_tx(dut, n))
    await set_run(dut, run=1)
    dut._log.info(f"Loaded {len(words)} instructions, {len(message)} message bytes")

    # Sanity-check the actual SRAM-backed top-level before spending millions
    # of cycles decoding UART. Firmware starts by enabling and idling TX high.
    await ClockCycles(dut.clk, 32)
    assert int(dut.uio_oe.value[0]) == 1, "firmware did not enable UART TX"
    assert int(dut.uio_out.value[0]) == 1, "firmware did not drive UART idle high"

    # Tiny Tapeout projects share the bidirectional bus. Deselecting this
    # project must immediately release every output without destroying state.
    dut.ena.value = 0
    await RisingEdge(dut.clk)
    assert int(dut.uio_oe.value) == 0, "uio outputs driven while ena is low"
    dut.ena.value = 1
    await RisingEdge(dut.clk)

    # Sample and decode the UART output
    dut._log.info("Sampling UART TX")
    samples = await sample_task
    transitions = sum(a != b for a, b in zip(samples, samples[1:]))
    dut._log.info(
        f"UART samples: low={samples.count(0)} high={samples.count(1)} transitions={transitions}"
    )

    got = []
    pos = 0
    for _ in range(len(message)):
        start = find_start(samples, pos)
        assert start is not None, "missing start bit"
        got.append(read_byte(samples, start))
        pos = start + 10 * BIT_TIME

    got_str = bytes(got).decode("ascii", errors="replace")
    expected = bytes(message).decode("ascii")
    dut._log.info(f"Decoded: {got_str!r}")
    assert got_str == expected, f"mismatch: got {got_str!r}, expected {expected!r}"
    dut._log.info("PASS")
