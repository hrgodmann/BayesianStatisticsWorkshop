# Ego depletion

Treat this as a study you ran a few years ago. The data are clean and ready,
and the frequentist analysis is written out below, so you start from a result
you already have and a conclusion you already drew.

Work through [the guide](../../guide.md) from step 2 onwards.

[← back to the session page](../../README.md)

---

## The study

Twenty-three labs ran the same experiment simultaneously to test **ego
depletion**: the claim that self-control is a limited resource, so that after a
demanding task less of it remains.

Each participant did two tasks in sequence.

1. **The manipulation.** Cross the letter *e* out of a page of text. Half the
   participants got a simple rule (cross out every *e*), half a fiddly rule
   with exceptions. Same page, more effort.
2. **The measure.** A computer task mixing easy *congruent* trials with hard
   *incongruent* ones. How much slower a participant is on the hard trials —
   the **interference effect** — is a standard index of available self-control.

If ego depletion holds, the fiddly-task group should show a larger interference
effect. Afterwards, participants rated how the letter-*e* task had felt.

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
| `interference` | `rt_incongruent − rt_congruent`. The outcome |
| `effort` · `difficulty` · `tiredness` · `frustration` | How the letter-*e* task felt, 1–7 |

Nothing needs recoding, filtering or merging, and the exclusions used in the
original analysis are already applied. The four rating scales are missing for
82 participants, since one lab did not collect them; JASP drops those cases
automatically.

---

## The frequentist analysis

### The effect

Mean interference was 0.31 s in the depletion group and 0.32 s in the control
group.

> *t*(2123.5) = 1.90, *p* = .057, *d* = −0.08

The difference runs in the opposite direction to the prediction: the depletion
group was very slightly faster. The published meta-analytic estimate across the
23 labs was *d* = 0.04, 95% CI [−0.07, 0.15].

### Manipulation checks

| Rating | Control | Depletion | | |
|---|---|---|---|---|
| `difficulty` | 1.85 | 3.98 | *t*(1737.2) = −40.42 | *p* < .001 |
| `frustration` | 1.95 | 3.08 | *t*(1881.3) = −17.30 | *p* < .001 |
| `effort` | 3.71 | 4.92 | *t*(2012.5) = −16.87 | *p* < .001 |
| `tiredness` | 3.32 | 3.44 | *t*(2039.2) = −1.63 | *p* = .104 |

The fiddly task was rated harder, more effortful and more frustrating, but not
more tiring.

### Other analyses

Two-way ANOVA on `interference`: `condition` *F*(1, 2137) = 3.62, *p* = .057;
`lang_group` *F* = 5.04, *p* = .025; interaction *F* = 3.34, *p* = .068.

Correlations with `interference`: `rt_congruent` *r* = −.118, *p* < .001;
`tiredness` *r* = .046, *p* = .039; `difficulty` *r* = .033, *p* = .14;
`effort` *r* = .005, *p* = .83; `acc_congruent` *r* = −.004, *p* = .84.

### The conclusion drawn

> The depletion manipulation was successful: participants in the depletion
> condition rated the task as significantly more difficult, more effortful and
> more frustrating. However, the predicted effect on self-control did not reach
> significance, *t*(2123.5) = 1.90, *p* = .057. We therefore failed to reject
> the null hypothesis and found no evidence for an ego-depletion effect.

Every sentence in that paragraph is defensible. At least one of them claims
less than it appears to.

---

## What to try

Take **one** of the four below through [the guide](../../guide.md). They are
independent of each other, and there is not time for all four. If you do only
one, do the first.

1. **The *p* = .057 result.** The Bayesian *t*-test for `condition` on
   `interference`.
2. **A significant correlation.** `interference` with `tiredness`, *r* = .046,
   *p* = .039.
3. **One lab at a time.** Filter to a single lab (the funnel icon above the
   data in JASP) and run the same *t*-test on roughly 100 participants rather
   than 2141. Do three or four labs.
4. **In R, with `brms`.** `interference ~ condition + (1 | lab)` — option 1
   again, with each lab given its own baseline.

### A warm-up

The Bayesian *t*-test for `condition` on `difficulty` takes a minute and
returns a Bayes factor unlike any from day 1. Useful for seeing the other end
of the scale before you start.

---

## Source

Data are from the public OSF repository at <https://osf.io/jymhe/>. So that you
know what you are holding, this is everything done to the original files:

- the exclusion rule from the paper was applied, leaving the 2141 participants
  it reports;
- the four post-task ratings were taken from each lab's own data file, because
  the pooled file on OSF retained them for only 9 of the 23 labs;
- one lab recorded missing ratings as `25` on a 1–7 scale, so those were set to
  missing;
- columns were renamed, and `age` was dropped because only 15 labs recorded it.

No values were altered, and no participants were removed beyond the exclusions
used in the paper.

> Hagger, M. S., Chatzisarantis, N. L. D., Alberts, H., Anggono, C. O.,
> Batailler, C., Birt, A. R., … Zwienenberg, M. (2016). A multilab
> preregistered replication of the ego-depletion effect. *Perspectives on
> Psychological Science, 11*(4), 546–573.
> <https://doi.org/10.1177/1745691616652873>

If you use this dataset outside the workshop, cite the paper.
