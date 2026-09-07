# Worksheet — your data, your analysis

**Name:** ________________________   **Date:** ______________

Work through this with your own dataset. Take notes as you go; you will want
them for the closing round.

[← back to the session page](README.md)

---

## 1 · What did you do before?

**Dataset (one sentence — what was measured, on whom?):**

<br>

**The analysis you ran:**

<br>

**What you reported:**

| | |
|---|---|
| Test statistic | |
| *p*-value | |
| Effect size / estimate | |
| Confidence interval | |

**The conclusion you drew, in words:**

<br>
<br>

---

## 2 · State the two hypotheses

A Bayes factor compares two models. Write them both out.

**H₀ (what does "no effect" mean here, concretely?):**

<br>

**H₁ (what does "an effect" mean — and how big would you expect it to be?):**

<br>

> If H₁ is hard to state, that is informative. It usually means the original
> analysis was testing against a null without a clear alternative in mind.

---

## 3 · Choose a prior

**Prior used:** ☐ default ☐ informed

**If informed, on what basis?** (previous study, meta-analysis, theory, gut feeling)

<br>

**If default, what is the default?** Look it up in the JASP output — you will
need to name it in a write-up.

<br>

---

## 4 · Run it

In JASP: the Bayesian version of your analysis sits next to the classical one
in the same menu.

| Frequentist | Bayesian equivalent in JASP |
|---|---|
| Independent-samples *t*-test | Bayesian Independent Samples T-Test |
| Paired-samples *t*-test | Bayesian Paired Samples T-Test |
| Correlation | Bayesian Correlation |
| One-way / factorial ANOVA | Bayesian ANOVA |
| Linear regression | Bayesian Linear Regression |
| χ² test of independence | Bayesian Contingency Tables |
| Test of two proportions | Bayesian A/B Test |
| Mixed model | `brms` in R — grab one of us |

**Record what you get:**

| | |
|---|---|
| BF₁₀ | |
| Posterior median / mean | |
| 95% credible interval | |
| Convergence looked OK? | ☐ yes ☐ no ☐ n/a |

---

## 5 · Check it holds up

**Robustness / prior sensitivity check** — vary the prior width. Does the
conclusion survive?

<br>

**Posterior distribution** — take a look at the plot. Is it narrow or wide?
Symmetric? Does it exclude zero, and by how much?

<br>

---

## 6 · Interpret

Circle one, and say why:

> **Evidence for an effect** · **Evidence for the absence of an effect** ·
> **Absence of evidence**

**Why:**

<br>

**Did the Bayesian analysis agree with what you originally concluded?**

☐ Yes, same story  ☐ Same direction, different confidence  ☐ Meaningfully different

**If it differed — what changed, and which version do you believe?**

<br>
<br>

---

## 7 · Write the sentence

Using the [reporting checklist](../resources/reporting-checklist.md), write the
two or three sentences you would put in a paper.

<br>
<br>
<br>

---

## Notes for the discussion

**What surprised you:**

<br>

**What was confusing, awkward, or broken:**

<br>

**What you would need in order to use this in your own work:**

<br>
