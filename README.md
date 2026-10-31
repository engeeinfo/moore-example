# Moore Sequence Detector

Verilog Moore finite-state machine that detects the `1011` input sequence.

## Requirements

- Icarus Verilog 11 or newer
- `make`

Run the self-checking simulation:

```sh
make test
```

## Structure

- `fsm.v` contains the original `seq_dect` implementation and the
  `moore_fsm_sd` compatibility wrapper used by the testbench.
- `fsm_tb.v` checks detection of `1011` and clearing after a non-matching
  input.
- `docs/ARCHITECTURE.md` describes the state machine.
- `docs/MODERNIZATION.md` records the baseline and audit.

The detector output is asserted while the FSM is in the terminal state.
