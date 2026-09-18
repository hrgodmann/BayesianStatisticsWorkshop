# Datasets, if you did not bring one

Two to choose from. Both are real published studies with clean data and the
frequentist analysis already written out, so you begin from a result you have
rather than from nothing.

Take one. They ask different questions, so choose whichever is closer to the
work you do.

[← back to the session page](../README.md) · [the seven-step guide](../guide.md)

---

### [`ego-depletion/`](ego-depletion/README.md) — is there an effect?

Two groups and one outcome: 2141 participants across 23 labs, testing whether
exerting self-control leaves you with less of it afterwards. The reported
result was *p* = .057, written up as a failure to reach significance.

Supports two-group comparisons, correlations, and a mixed model in `brms`.

### [`college-success/`](college-success/README.md) — which predictors matter?

One outcome and five predictors: 224 students, their university GPA, and what
was known about them beforehand from high-school grades and SAT scores. Four of
the five predictors were not significant, and the write-up treated all four
alike.

Supports regression and multi-model inference, as taught on day 2.

---

## What is in each folder

| | |
|---|---|
| `README.md` | The study, the data, the frequentist results, and what to try |
| a single `.csv` | The data, ready to open — no recoding, filtering or merging |

Neither needs anything installed beyond JASP. Only one option in the
ego-depletion folder uses R.

---

Both datasets were chosen because the published frequentist conclusion contains
at least one claim that a Bayes factor would qualify. The original analyses are
not in error. The exercise is to find the gap between what was concluded and
what the data support.
