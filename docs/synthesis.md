# Synthesis and physical-design results

## Latest run: Tiny Tapeout CI, commit `7f6a6e7`

Official `tt-gds-action@ttihp26b` flow on the final RTL (input synchroniser,
X-safe SRAM fetch), 20 ns clock, 6x4 tiles:

- GDS, precheck and gate-level test all pass. The precheck covers KLayout
  SG13G2 DRC, zero-area, pin-label, pin, boundary, layer, cell-name, analog-pin
  and Verilog-syntax checks.
- Detailed-routing DRC 0, antenna 0, LVS 0 errors, 0 max-slew/cap violations,
  0 power-grid violations
- Setup/hold violations 0 in all corners:

| Corner | Worst setup slack | Worst hold slack |
|---|---:|---:|
| fast 1.32 V / -40 C | 11.534 ns | 0.088 ns |
| typical 1.20 V / 25 C | 11.239 ns | 0.283 ns |
| slow 1.08 V / 125 C | 5.890 ns | 0.566 ns |

- Instance area 885,233 um^2 including SRAM macros; utilization 16.6%
- The gate-level test runs the same cocotb UART test on the post-layout netlist
  with the IHP SRAM behavioural models.

The sections below record the earlier `final-precheck-20260925` run (before the\ninput synchroniser).

The SRAM-backed ProtoCore completes the IHP SG13G2 LibreLane flow in its 6x4
Tiny Tapeout allocation. The recorded run is `final-precheck-20260925`, using
a 20 ns clock constraint and the IHP program/data SRAM macros.

## Final routed result

- Die: 1289.28 x 710.64 µm (6x4 tiles)
- Logic before physical optimization: 4,328 cells, 62,011 µm²
- SRAM macros: 66,275 µm² total
- Final standard cells: 5,730, including CTS and timing-repair buffers
- Final standard-cell area: 81,352 µm²
- Standard-cell utilization: 9.73%; macros plus standard cells: 16.36%
- Detailed-routing DRC: 0 violations
- Antenna: 0 violations after five antenna diodes
- LVS: circuits match uniquely; 0 device, net, property, or pin errors
- Electrical design rules: 0 maximum-slew and 0 maximum-capacitance violations
- Power integrity: VPWR and VGND fully connected; worst reported IR drop 0.05%

## Post-route timing at 50 MHz

All configured corners have zero setup and hold violations:

| Corner | Worst setup slack | Worst hold slack |
|---|---:|---:|
| fast 1.32 V / -40 C | 11.561 ns | 0.091 ns |
| typical 1.20 V / 25 C | 11.361 ns | 0.298 ns |
| slow 1.08 V / 125 C | 6.119 ns | 0.603 ns |

The IHP SRAM library names its fast model at -55 C; LibreLane maps that model
to the PDK's `nom_fast_1p32V_m40C` analysis corner.

## DRC qualification note

OpenROAD's detailed router closes at zero violations. The full official IHP
KLayout deck at the Tiny Tapeout precheck PDK revision
`22f43352dd8219f9007eb659e422e0d5fe28c5fb` also reports zero markers. Magic
full-GDS DRC remains disabled in `src/config.json`: unlike the official deck,
it expands and rechecks qualified SRAM internals without the SRAM-specific
exemptions and therefore produces false macro-internal markers.

## Memory integration

Program memory uses `RM_IHPSG13_1P_256x16_c2_bm_bist`; data memory uses
`RM_IHPSG13_2P_256x8_c2_bm_bist`. Synthesis reads small black-box declarations,
simulation reads the IHP behavioral models, and physical implementation binds
the macro LEF/GDS plus fast, typical, and slow Liberty views. The macros are
fixed at (67.3, 60) and (340, 60) µm and connect their Metal4 supplies to the
TopMetal1 grid. The custom PDN adds one boundary-reaching VGND stripe over the
1P SRAM access strap so the generated abstract LEF also passes Tiny Tapeout's
power-pin accessibility check.

`make area` provides a quick technology-independent check and currently reports
3,121 generic logic cells plus the two black-box SRAM instances. The complete
physical flow is the authoritative area and timing result.

## Reproduction

Generate Tiny Tapeout's merged configuration, then run LibreLane against the
IHP PDK:

```sh
python tt/tt_tool.py --create-user-config --ihp
python -m librelane --docker-no-tty --dockerized \
  --pdk ihp-sg13g2 src/config_merged.json
```

The final flow views include GDS, LEF, DEF, ODB, gate-level and powered
netlists, SDC, SPICE, metrics, and a rendered layout PNG.
