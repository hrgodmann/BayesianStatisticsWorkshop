# Ego Depletion — an effect you already tested

Treat this as a study you ran a few years ago. The data are cleaned and ready —
the way your own file would be if you had already analysed it and published it.
The frequentist analysis is written out below, results and all, so you are
starting exactly where everyone else in the room is starting: **with a result
you already have, and a conclusion you already drew.**

Your job is [the guide](../../guide.md), from step 2 onwards.

[← back to the provided datasets](../README.md)

---

## The study

Twenty-three labs ran the same experiment at the same time to test **ego
depletion** — the idea that self-control is a limited resource, so that after
a demanding task you have less of it left.

Each participant did two tasks in a row.

1. **The manipulation.** Cross the letter *e* out of a page of text. Half got a
   simple rule (cross out every *e*); half got a fiddly rule with exceptions.
   Same page, much more effort.
2. **The measure.** A computer task mixing easy *congruent* trials with hard
   *incongruent* ones. How much slower you are on the hard ones — the
   **interference effect** — is the standard index of available self-control.

If ego depletion is real, the fiddly-task group should show a **larger**
interference effect. Afterwards everyone rated how the letter-*e* task felt.

---

## The data

`ego-depletion.csv` — 2141 participants, 23 labs, one row each.

| Variable | Meaning |
|---|---|
| `id` | Participant |
| `lab` | Which of the 23 labs ran them |
| `condition` | `control` (simple rule) or `depletion` (fiddly rule) |
| `lang_group` | Whether the lab tested in English or another language |
| `rt_congruent` · `rt_incongruent` | Mean reaction time, seconds |
| `acc_congruent` · `acc_incongruent` | Proportion correct |
| `interference` | `rt_incongruent − rt_congruent`. **The outcome.** |
| `effort` · `difficulty` · `tiredness` · `frustration` | How the letter-*e* task felt, 1–7 |

Nothing needs recoding, filtering or merging. The exclusions the original
analysis used are already applied. The four rating scales are missing for 82
people (one lab did not collect them); JASP drops those cases on its own.

---

## The frequentist analysis — what you found last time

### The effect

The depletion group's interference effect was **0.31 s**; the control group's
was **0.32 s**.

> *t*(2123.5) = 1.90, *p* = .057, *d* = −0.08

Note the direction. The depletion group came out very slightly **better**,
which is the opposite of the prediction. Published alongside it was a
meta-analytic estimate across the 23 labs of *d* = 0.04, 95% CI [−0.07, 0.15].

### The manipulation checks

| Rating | Control | Depletion | | |
|---|---|---|---|---|
| `difficulty` | 1.85 | 3.98 | *t*(1737.2) = −40.42 | *p* < .001 |
| `frustration` | 1.95 | 3.08 | *t*(1881.3) = −17.30 | *p* < .001 |
| `effort` | 3.71 | 4.92 | *t*(2012.5) = −16.87 | *p* < .001 |
| `tiredness` | 3.32 | 3.44 | *t*(2039.2) = −1.63 | *p* = .104 |

The fiddly task was harder, more effortful and more frustrating. It did not
make anyone more tired.

### Everything else

Two-way ANOVA on `interference`: `condition` *F*(1, 2137) = 3.62, *p* = .057;
`lang_group` *F* = 5.04, *p* = .025; interaction *F* = 3.34, *p* = .068.

Correlations with `interference`: `rt_congruent` *r* = −.118, *p* < .001;
`tiredness` *r* = .046, *p* = .039; `difficulty` *r* = .033, *p* = .14;
`effort` *r* = .005, *p* = .83; `acc_congruent` *r* = −.004, *p* = .84.

### What you concluded

> The depletion manipulation was successful: participants in the depletion
> condition rated the task as significantly more difficult, more effortful and
> more frustrating. However, the predicted effect on self-control did not reach
> significance, *t*(2123.5) = 1.90, *p* = .057. We therefore failed to reject
> the null hypothesis and found no evidence for an ego-depletion effect.

That paragraph is the one to revisit. Every sentence in it is defensible and
at least one of them is doing much less work than it looks like.

---

## Now redo it

**Pick one of the four below and take it through [the guide](../../guide.md).**
They are independent — you do not need the earlier ones to do the later ones,
and there is not time for all four. If you finish early, come back and take a
second one.

If you only do one, do the first.

---

### 1 · The *p* = .057 result

The Bayesian *t*-test for `condition` on `interference`.

*p* = .057 licenses exactly one sentence: "we failed to reject the null." Ask
the question it cannot answer — **is this evidence that there is no effect, or
no evidence either way?** Then widen and narrow the prior and see whether your
answer survives.

This is the session in miniature, which is why it is first.

### 2 · The significant correlation that isn't

`interference` with `tiredness`: *r* = .046, *p* = .039.

Significant. In a paper it becomes "tiredness was significantly associated with
interference". Ask the Bayesian version what it makes of the same numbers, and
decide which of the two you would want a reader to see.

### 3 · One lab at a time

Filter to a single lab (the funnel icon above the data in JASP) and run the
`condition` → `interference` *t*-test on ~100 people instead of 2141. Do three
or four labs.

What would each of them have concluded, had it run this study alone and
published it? You are looking at the literature that would have existed.

### 4 · In R, with `brms`

`interference ~ condition + (1 | lab)`

The *t*-test above, plus the admission that the 2141 people came from 23
different labs and each lab has its own baseline. One outcome, one predictor,
one grouping factor — as small as a mixed model gets.

Compare the `condition` coefficient against the *p* = .057 result reported
earlier on this page. Does letting labs differ change the picture?

---

> **Warming up?** The Bayesian *t*-test for `condition` on `difficulty` takes a
> minute and returns a Bayes factor unlike anything from day 1. Useful for
> seeing what the scale looks like at the other end before you start.

## Source

Data are from the public OSF repository at <https://osf.io/jymhe/>. So you know
exactly what you are holding, this is everything that was done to the original
files:

- the paper's own exclusion rule was applied, leaving the 2141 participants it
  reports;
- the four post-task ratings were taken from each lab's own data file, because
  the pooled file on OSF kept them for only 9 of the 23 labs;
- one lab recorded missing ratings as `25` on a 1–7 scale, so those were set to
  missing;
- columns were renamed, and `age` was dropped because only 15 labs recorded it.

No values were altered, and no participants were removed beyond the paper's own
exclusions.

> Hagger, M. S., Chatzisarantis, N. L. D., Alberts, H., Anggono, C. O.,
> Batailler, C., Birt, A. R., … Zwienenberg, M. (2016). A multilab
> preregistered replication of the ego-depletion effect. *Perspectives on
> Psychological Science, 11*(4), 546–573.
> <https://doi.org/10.1177/1745691616652873>

If you use this dataset outside the workshop, cite the paper, not us.
