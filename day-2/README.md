# Day 2 — Multi-model inference and hierarchical models

We start in **JASP** and move to **R**. Make sure R, RStudio and `brms` are
working before the session starts — see [`../setup/`](../setup/README.md) and
run the installation check.

[← back to the main page](../README.md)

---

## Sessions

### 1 · Bayesian multi-model inference · Henrik

- Theory: Model averaging and inclusion Bayes factors
- **Hands-on:** linear regression in JASP
- **Hands-on:** ANOVA in JASP

### 2 · Mixed-effects regression in R with `brms`

- Theory — *Julius*
- Prior predictive checks — *Henrik*
- Posterior predictive checks — *Henrik*
- Implementation — walking through a full model together

> ⚠️ The first `brms` model you fit compiles Stan code, which can take a few
> minutes. Run the installation check **before** the workshop so this does not
> eat into the session.

### 3 · How to report a Bayesian analysis · Julius

Checklist to take away: [`../resources/reporting-checklist.md`](../resources/reporting-checklist.md)

### 4 · Your data, your analysis · Julius & Henrik

Take the last frequentist analysis you ran, and run it again as a Bayesian
analysis. We circulate and help. Short round of conclusions at the end.

Worksheet: [`../bring-your-own-data/`](../bring-your-own-data/README.md)

### 5 · Beyond the workshop

- Simulation-based calibration (SBC) — *Henrik*
- In R: [Stan](https://mc-stan.org), [`bridgesampling`](https://cran.r-project.org/package=bridgesampling),
  [`blavaan`](https://ecmerkle.github.io/blavaan/), [`bsts`](https://cran.r-project.org/package=bsts),
  [`RoBMA`](https://fbartos.github.io/RoBMA/) — *Julius*
- Further reading — *Julius & Henrik*

### 6 · Discussion & close — Julius & Henrik

---

## Files

| Folder | Contents |
|---|---|
| [`jasp/`](jasp/) | `.jasp` files for the regression and ANOVA sessions |
| [`r/`](r/) | R scripts for the `brms` session |
| [`data/`](data/) | Datasets, as `.csv` |

**Naming convention:** `NN-topic.ext` matching the session numbers above —
e.g. `01-multimodel-regression.jasp`, `02-brms-mixed-effects.R`.
