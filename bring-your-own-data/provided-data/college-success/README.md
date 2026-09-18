# College success

Treat this as a study you ran a few years ago. The data are clean and ready,
and the frequentist analysis is written out below, so you start from a result
you already have and a conclusion you already drew.

Work through [the guide](../../guide.md) from step 2 onwards.

[← back to the provided datasets](../README.md)

---

## The study

224 university students. For each one you have their grade point average after
three semesters, and five things known about them before they arrived: average
high-school grades in three subjects, and two SAT scores.

The question is which of these predicts how well someone does at university.

---

## The data

`college-success.csv` — 224 students, one row each, nothing missing.

| Variable | Meaning | Mean (SD) |
|---|---|---|
| `id` | Student | |
| `gpa` | Grade point average after three semesters. The outcome | 2.64 (0.78) |
| `hsm` | Average high-school grade in mathematics | 8.32 (1.64) |
| `hss` | Average high-school grade in science | 8.09 (1.70) |
| `hse` | Average high-school grade in English | 8.09 (1.51) |
| `satm` | SAT score, mathematics | 595 (86) |
| `satv` | SAT score, verbal | 505 (93) |

The five predictors are all correlated with one another, in places quite
strongly (`hss` with `hse`, *r* = .58). This is worth keeping in mind when
asking which of them matters.

> The source file also contains a `sex` variable, but does not document what
> its two codes mean, so it has been left out rather than included as a guess.

---

## The frequentist analysis

### Step 1 · high-school grades

Predicting `gpa` from `hsm`, `hss` and `hse`:

> *R*² = .205, *F*(3, 220) = 18.86, *p* < .001

| Predictor | *b* | SE | *t* | *p* |
|---|---|---|---|---|
| `hsm` | 0.169 | 0.036 | 4.75 | < .001 |
| `hss` | 0.034 | 0.038 | 0.91 | .362 |
| `hse` | 0.045 | 0.039 | 1.17 | .245 |

The model is significant, but only the mathematics grade contributes.

### Step 2 · adding the SAT scores

Adding `satm` and `satv`:

> Δ*R*² = .007, *F*(2, 218) = 0.95, *p* = .388

| Predictor | *b* | SE | *t* | *p* |
|---|---|---|---|---|
| `hsm` | 0.146 | 0.039 | 3.72 | < .001 |
| `hss` | 0.036 | 0.038 | 0.95 | .343 |
| `hse` | 0.055 | 0.040 | 1.40 | .164 |
| `satm` | 0.00094 | 0.00069 | 1.38 | .170 |
| `satv` | −0.00041 | 0.00059 | −0.69 | .492 |

Neither SAT score reaches significance.

### Correlations with `gpa`

`hsm` *r* = .44 (*p* < .001) · `hss` *r* = .33 (*p* < .001) ·
`hse` *r* = .29 (*p* < .001) · `satm` *r* = .25 (*p* < .001) ·
`satv` *r* = .11 (*p* = .087)

### The conclusion drawn

> High-school grades predicted university GPA, *R*² = .21, *F*(3, 220) = 18.86,
> *p* < .001. Of the three, only mathematics was a significant predictor,
> *b* = 0.17, *p* < .001; science and English were not (*p*s > .24). Adding SAT
> scores did not significantly improve the model, Δ*R*² = .007, *p* = .388, and
> neither SAT score was a significant predictor. We concluded that high-school
> mathematics performance is the key predictor of university success and that
> SAT scores add nothing beyond it.

That paragraph disposes of four predictors with the word "not", and treats all
four identically.

---

## What to try

Take **one** of the four below through [the guide](../../guide.md). They are
independent of each other, and there is not time for all four. If you do only
one, do the first.

1. **The four non-significant predictors.** Bayesian linear regression with all
   five, and the inclusion Bayes factor for each. The write-up treated `hss`,
   `hse`, `satm` and `satv` alike.
2. **The SAT scores.** `hsm` on its own against `hsm` plus both SAT scores.
3. **Model choice.** The Bayesian regression ranks all 32 combinations of the
   five predictors. Look at the posterior probability of the best one.
4. **The prior.** Change the prior scale in the regression options and re-run.

---

## Source

This is the **College Success** dataset from the JASP Data Library
(*Regression* → *College Success*), unchanged apart from the removal of the
undocumented `sex` column.

> Moore, D. S., McCabe, G. P., & Craig, B. A. (2012). *Introduction to the
> Practice of Statistics* (7th ed.). New York: Freeman.
>
> Campbell, P. F., & McCabe, G. P. (1984). Predicting the success of freshmen
> in a computer science major. *Communications of the ACM, 27*, 1108–1113.
