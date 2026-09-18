# College Success — a regression you already ran

Treat this as a study you ran a few years ago. The data are clean and ready.
The frequentist analysis is written out below, results and all, so you start
where everyone else in the room starts: **with a result you already have, and a
conclusion you already drew.**

Your job is [the guide](../../guide.md), from step 2 onwards.

[← back to the provided datasets](../README.md)

---

## The study

224 university students. For each one you have their **grade point average
after three semesters** of university, and five things you knew about them
*before* they arrived: their average high-school grades in three subjects, and
their two SAT scores.

The question is the obvious one an admissions office would ask. **Which of
these actually predicts how well someone does at university?**

---

## The data

`college-success.csv` — 224 students, one row each, nothing missing.

| Variable | Meaning | Mean (SD) |
|---|---|---|
| `id` | Student | |
| `gpa` | **Grade point average after three semesters.** The outcome | 2.64 (0.78) |
| `hsm` | Average high-school grade in mathematics | 8.32 (1.64) |
| `hss` | Average high-school grade in science | 8.09 (1.70) |
| `hse` | Average high-school grade in English | 8.09 (1.51) |
| `satm` | SAT score, mathematics | 595 (86) |
| `satv` | SAT score, verbal | 505 (93) |

The five predictors are all correlated with each other, some quite strongly
(`hss` with `hse`, *r* = .58). Worth remembering when you start asking which
of them matters.

> The source file also carries a `sex` variable, but does not document what its
> two codes mean, so it is left out rather than shipped as a guess.

---

## The frequentist analysis — what you found last time

### Step 1 · high-school grades

Predicting `gpa` from `hsm`, `hss` and `hse`:

> *R*² = .205, *F*(3, 220) = 18.86, *p* < .001

| Predictor | *b* | SE | *t* | *p* |
|---|---|---|---|---|
| `hsm` | 0.169 | 0.036 | 4.75 | **< .001** |
| `hss` | 0.034 | 0.038 | 0.91 | .362 |
| `hse` | 0.045 | 0.039 | 1.17 | .245 |

The model works, but only the maths grade carries it.

### Step 2 · adding the SAT scores

Adding `satm` and `satv` on top:

> Δ*R*² = .007, *F*(2, 218) = 0.95, *p* = .388

| Predictor | *b* | SE | *t* | *p* |
|---|---|---|---|---|
| `hsm` | 0.146 | 0.039 | 3.72 | **< .001** |
| `hss` | 0.036 | 0.038 | 0.95 | .343 |
| `hse` | 0.055 | 0.040 | 1.40 | .164 |
| `satm` | 0.00094 | 0.00069 | 1.38 | .170 |
| `satv` | −0.00041 | 0.00059 | −0.69 | .492 |

Nothing new reaches significance.

### Simple correlations with `gpa`

`hsm` *r* = .44 (*p* < .001) · `hss` *r* = .33 (*p* < .001) ·
`hse` *r* = .29 (*p* < .001) · `satm` *r* = .25 (*p* < .001) ·
`satv` *r* = .11 (*p* = .087)

### What you concluded

> High-school grades predicted university GPA, *R*² = .21, *F*(3, 220) = 18.86,
> *p* < .001. Of the three, only mathematics was a significant predictor,
> *b* = 0.17, *p* < .001; science and English were not (*p*s > .24). Adding SAT
> scores did not significantly improve the model, Δ*R*² = .007, *p* = .388, and
> neither SAT score was a significant predictor. We concluded that high-school
> mathematics performance is the key predictor of university success and that
> SAT scores add nothing beyond it.

Look at how many predictors that paragraph disposes of with the single word
"not". Four of them, all treated identically. That is the thing to go after.

---

## Now redo it

**Pick one of the four below and take it through [the guide](../../guide.md).**
They are independent, and there is not time for all four. If you finish early,
come back for a second.

If you only do one, do the first.

---

### 1 · Are the four non-significant predictors really the same?

Run the Bayesian linear regression with all five predictors and look at the
**inclusion Bayes factor** for each.

`hss`, `hse`, `satm` and `satv` were all "not significant" and your write-up
treated them as one undifferentiated lump. Ask the Bayesian analysis to rank
them. Is the evidence against including each one the same? Is it the same
*kind* of statement as "*p* = .49"?

For at least one of them you will be able to say something you could not say
before. For at least one other you will have to admit you still do not know.

### 2 · Do the SAT scores earn their place?

Compare a model with just `hsm` against `hsm` plus both SAT scores.

*p* = .388 let you say the SAT scores failed to improve the model. It did not
let you say they are useless. Quantify the difference — and then decide whether
an admissions office should keep paying for the test.

### 3 · Which model is "the" model?

The regression output ranks all 32 combinations of the five predictors. Look at
the posterior probability of the best one.

It is lower than you expect. What should you report when no single model is
convincingly the right one — and what is model averaging for?

### 4 · Does the answer depend on the prior?

Change the prior scale in the Bayesian regression options and re-run.

Which conclusions move, and which stay put? A result that survives this is
worth more than one that does not, and knowing which is which is the point of
doing it.

---

## Source

This is the **College Success** dataset from the JASP Data Library
(*Regression* → *College Success*), unchanged apart from dropping the
undocumented `sex` column.

> Moore, D. S., McCabe, G. P., & Craig, B. A. (2012). *Introduction to the
> Practice of Statistics* (7th ed.). New York: Freeman.
>
> Campbell, P. F., & McCabe, G. P. (1984). Predicting the success of freshmen
> in a computer science major. *Communications of the ACM, 27*, 1108–1113.
