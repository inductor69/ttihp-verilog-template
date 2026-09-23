# Synthesis findings (IHP 130nm via Tiny Tapeout)

## Flow (validated up to synthesis)

- `tt-support-tools` + `librelane==3.0.3` + `PDK=ihp-sg13g2` in a Docker
  (LibreLane container, 5.6 GB image) on macOS/OrbStack.
- `./tt/tt_tool.py --create-user-config --ihp` and `--harden --ihp` work.
  Python 3.12/3.13 required (3.14 breaks `yamlcore`).
- `user_config.json` confirmed the 6x4 tile (`DIE_AREA 0 0 1289.28 710.64`,
  `tt_block_6x4_pgvdd.def`).

## Yosys technology-independent synthesis (local, `make area`)

| Version | Cells | Registers | Notes |
|---------|-------|-----------|-------|
| Original (2W4R data mem) | 36,657 | 6529 | 6144 = memories as flip-flops |
| After 1R1W rework | 22,405 | ~595 + 6144 mem flops | read-port muxes removed |

Logic (non-memory) ~ 16k cells / ~25-40k gate-equivalents. Registers ~600
(excluding the 6,144 memory flops).

## LibreLane P&R run (after the synchronous-fetch fix)

The **synchronous program fetch** (instruction register + `fetch_addr` pipeline)
preserves the exact 1-cycle ISA timing model (all 11 tests pass) and lets the
flow complete:

- Full LibreLane flow runs: synthesis -> floorplan -> placement -> CTS ->
  detailed routing -> GDS stream-out (64 MB GDS produced).
- **Standard-cell utilization: 84.6%** (routing DRC clean: 0 violations).
  This confirms the flip-flop memories nearly fill the tile.
- **Timing (50 MHz / 20 ns):**
  - nominal 1.20V/25C: setup WNS **0 ns** (closes), hold 0 ns
  - fast 1.32V/-40C: setup -3.17 ns, hold -0.06 ns (fails)
  - slow 1.08V/125C: setup -28.96 ns (fails; the long async data-memory read
    path dominates)

**Conclusion (unchanged):** the SRAM-macro integration is required (84.6% util
is not manufacturable) and sufficient (~29% util); it should also fix the
slow-corner timing by removing the async 256:1 read muxes.

## Area numbers (IHP sg13g2, via local Yosys ABC against the PDK liberty)

`make area` runs a generic Yosys synthesis; the numbers below are from
`yosys synth + abc -liberty sg13g2_stdcell + stat -liberty`.

| Configuration | Cells | Area (µm²) | % of 6x4 tile (0.7 mm²) |
|---------------|-------|-----------|--------------------------|
| Memories as flip-flops (current RTL) | 14,301 (post-ABC) | **553,949** | **~79% (won't route comfortably)** |
| With IHP SRAM macros (est.) | ~8k + 2 macros | **~204,000** | **~29% (fits)** |

Breakdown (flop-memory version):
- Combinational logic: 106,085 µm² (mux-heavy datapath/ALU)
- 6,144 memory flip-flops: ~323,000 µm² (`sg13g2_dfrbp_1` ≈ 52.6 µm² each)
- ~600 architectural registers: ~31,000 µm²

With SRAM macros: program 256x16 = 236.8 x 118.78 µm (28,127 µm²) + data
256x8 = 278.5 x 137.0 µm (38,148 µm²) = 66,275 µm² total, replacing ~323,000
µm² of flip-flops.

**Conclusion:** integrating the SRAM macros is *required* (flop memories are
79% of the tile) and *sufficient* (~29% utilization).

## The blocking issue (why the LibreLane ABC run stalls)

Both memories (256x16 program, 256x8 data) are **synthesized as flip-flop
arrays** (6,144 DFFs) rather than SRAM macros, and the **asynchronous read
port (256:1 mux)** creates a large combinational cloud. Yosys' ABC pass
mapping to the IHP `sg13g2` cell library ran >20 min without completing at
22k cells; the generic (non-PDK) synthesis completes in ~3 s.

Root cause: LibreLane does not automatically infer the IHP SRAM macros from a
generic `always @(posedge) ... mem[addr]` pattern.

## Available SRAM macros (exact fits)

The IHP PDK ships an `sg13g2_sram` library including:
- `RM_IHPSG13_1P_256x16_c2_bm_bist` — single-port 256x16 (program memory)
- `RM_IHPSG13_2P_256x8_c2_bm_bist` — two-port (1W/1R) 256x8 (data memory)

Both match the design's dimensions exactly.

## Recommended fix (next step)

1. Instantiate the two SRAM macros as Hardcaml blackboxes (tie off the
   `A_BIST_*` ports; 1P macro needs a write/read enable mux since the program
   is loaded before the core runs).
2. Make the memories **synchronous-read** and pipeline the core fetch:
   add an instruction register (ir) so decode reads `ir` instead of the
   async memory output. This adds a 1-cycle fetch latency / branch handling.
3. Re-run `--harden`; expect the flop count to drop ~6k and ABC to complete.

Fallback if a full rework is not feasible: shrink program memory to
128x16 (7-bit PC) and data to 128x8 to reduce the flop array; the SRAM macro
path remains the correct long-term answer.