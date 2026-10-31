# Architecture

The design is a five-state Moore machine:

```text
zero → one → onezero → onezeroone → onezerooneone
```

Each state represents the longest suffix of the observed stream that matches
the prefix of `1011`. Mismatches either return to `zero` or retain a shorter
valid prefix. `dect_out` is high only in `onezerooneone`.

`moore_fsm_sd` is a naming/port wrapper around `seq_dect`; it keeps the
testbench-facing `clock` and `detector_out` names while preserving the
original implementation module.
