# Modernization record

## Baseline

Baseline captured on 2026-10-31 from `main`.

| Area | Result | Notes |
| --- | --- | --- |
| Stack | Verilog | FSM source and testbench. |
| Build | Failed | Testbench referenced missing `moore_fsm_sd`; source declared `seq_dect` with different port names. |
| Tests | Weak | Existing testbench had no assertions and did not finish. |
| Lint | Missing | No HDL quality gate existed. |
| License | Missing | Added MIT license. |
| CI | Missing | Added simulation workflow. |

## Audit findings

1. **High — compile blocker:** testbench/design module and port names did not
   match.
2. **Medium — weak verification:** no expected output was checked for the
   documented `1011` sequence.
3. **Low — unclear project contract:** behavior and state meanings were not
   documented.

No secrets or external dependency vulnerabilities were found.

## Changes

- Added a compatibility wrapper matching the testbench contract.
- Added self-checking detection and reset regressions.
- Added README, architecture documentation, CI, Makefile, license, and ignore
  rules.

The original `seq_dect` module remains available; no existing module was
removed.
