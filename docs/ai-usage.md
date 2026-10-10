# How AI tools were used

Claude Code (Anthropic) was used as a coding and verification assistant.
In the verification-hardening session it:

- reviewed the design against the competition rules and listed gaps;
- proposed and implemented the 2-flop input synchroniser, mirrored in the
  reference model;
- widened the constrained-random differential test, which exposed the halted
  `LD` readback bug and a reference-model shift bug;
- wrote the JTAG IDCODE firmware and its TAP-model test;
- ran the Hardcaml tests, the formal proofs, the cocotb test and the LibreLane
  hardening flow, and read the resulting metrics.

Every change was checked by the test suite and the physical flow rather than
accepted on trust, and the generated Verilog in `src/project.v` is always
rebuilt from the Hardcaml source with `make rtl`.
