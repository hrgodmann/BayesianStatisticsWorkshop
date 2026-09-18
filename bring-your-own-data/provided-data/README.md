# Datasets, if you did not bring one

Two to choose from. Both are real, published studies with clean data and a
frequentist analysis already written out — so you are not starting from
nothing, you are starting where the rest of the room is: with a result you
already have and a conclusion you already drew.

**Pick one.** They ask different questions, so choose the one that looks more
like the work you actually do.

[← back to the session page](../README.md) · [the seven-step guide](../guide.md)

---

### [`ego-depletion/`](ego-depletion/README.md) — is there an effect?

Two groups, one outcome. 2141 participants across 23 labs testing whether
exerting self-control leaves you with less of it afterwards.

The reported result was ***p* = .057** — the kind of number that gets written
up as "failed to reach significance" and quietly hoped over. Go after what that
sentence is and is not allowed to claim.

Comparisons of two groups, correlations, and — if you want it — a mixed model
in `brms`.

### [`college-success/`](college-success/README.md) — which predictors matter?

One outcome, five predictors. 224 students, their university GPA, and what was
known about them before they arrived: high-school grades and SAT scores.

Four of the five predictors came out "not significant", and the write-up
treated all four the same way. They are not the same. Sorting them out is
regression and multi-model inference — day 2 morning, applied.

---

## What is in each folder

| | |
|---|---|
| `README.md` | The study, the data, the frequentist results, and what to try |
| a single `.csv` | The data. Ready to open — no recoding, filtering or merging |

Neither needs anything installed beyond JASP. Only one option in the
ego-depletion folder uses R.

---

## A note on what these are for

Both datasets were chosen because the frequentist write-up contains at least
one sentence that does not survive contact with a Bayes factor. That is the
exercise. You are not looking for a mistake in the original analysis — there
isn't one. You are looking for the gap between what was concluded and what the
data actually support.
