# Day 1 — From Bayes' theorem to real analyses

Everything on day 1 happens in **JASP**. No R, no code. If JASP is not yet
installed, see [`../setup/`](../setup/README.md).

[← back to the main page](../README.md)

---

## Run sheet

### 1 · Introduction & peer exchange — 30 min · Julius

- Who we are, and what we do
- Who you are: your research, your methods
- What have you heard about Bayesian statistics?
- Have you used Bayesian methods? If yes — how did it go? If no — what stopped you?
- Bayes is increasingly common (with numbers)

### 2 · Bayesian basics — 15 min · Julius

- The Bayesian learning cycle
- Probability
- Bayes' theorem

### 3 · Bayesian estimation — 30 min · Julius

- Theory
- **Hands-on:** beta-binomial in JASP

### 4 · Bayesian testing — 30 min · Julius

- Theory
- **Hands-on:** beta-binomial in JASP

### 5 · Why bother? The benefits — 20 min · Julius

- What a *p*-value cannot do: no measure of evidence; optional stopping;
  evidence only *against* the null. (*p* = .049 corresponds to which Bayes factor?)
- Evidence of an effect vs. evidence of absence vs. absence of evidence
- Credible intervals vs. confidence intervals

### 6 · JASP with real data — 3 × 30 min · Henrik

Three analyses, three real datasets. Follow along on your own machine.

| | Analysis | Dataset |
|---|---|---|
| 6a | Correlation | <!-- TODO: dataset name --> |
| 6b | A/B test & *t*-test | <!-- TODO: dataset name --> |
| 6c | Two proportions | <!-- TODO: dataset name --> |

### 7 · JASP AI — 20 min · Henrik

### 8 · Further reading — 15 min · Julius & Henrik

See [`../resources/further-reading.md`](../resources/further-reading.md).

### 9 · Discussion, feedback, outlook to day 2 — 35 min · Julius & Henrik

---

## Files

| Folder | Contents |
|---|---|
| [`slides/`](slides/) | Slide decks (PDF), one per session |
| [`jasp/`](jasp/) | `.jasp` files — open these to see the finished analyses |
| [`data/`](data/) | Datasets used in session 6, as `.csv` |

**Naming convention:** `NN-topic.ext`, matching the session numbers above —
e.g. `03-bayesian-estimation.pdf`, `06a-correlation.jasp`, `06a-correlation.csv`.
