# Guide — your data, your analysis

Take the last frequentist analysis you ran, and run it again as a Bayesian one.
This is a route through it rather than a form: skip what does not apply, take
notes only where they help you, and grab one of us whenever you get stuck.

[← back to the session page](README.md)

---

## 1 · Start from what you already have

Remind yourself what the original analysis was — what was measured and on whom,
which test you ran, and what you reported: the test statistic, the *p*-value,
the effect size, the confidence interval.

Most of all, the conclusion you drew in words. That sentence is what we are
going to revisit.

---

## 2 · State the two hypotheses

A Bayes factor always compares two models, so both have to be explicit. What
does "no effect" mean here, concretely? And what does "an effect" mean — how
large would you actually expect it to be?

> If H₁ is hard to pin down, that is informative in itself. It usually means the
> original analysis was testing against a null without a clear alternative in
> mind.

---

## 3 · Choose a prior

Default or informed — either is defensible. What matters is that you can name
it afterwards.

If you take the default, find out from the JASP output what that default
actually is; you will need it in a write-up. If you go informed, be ready to say
what it rests on: a previous study, a meta-analysis, theory, or a considered
guess.

---

## 4 · Run it

In JASP the Bayesian version of your analysis sits next to the classical one in
the same menu.

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

Worth keeping track of as you go: the Bayes factor, the posterior median, the
95% credible interval, and whether convergence looked healthy.

---

## 5 · Check it holds up

Vary the prior width and see whether the conclusion survives. This matters most
when the Bayes factor sits near 1.

Then look at the posterior itself. Is it narrow or wide? Symmetric? Does it
exclude zero, and by how much?

---

## 6 · Interpret

Three outcomes are possible, and telling them apart is the whole point:
**evidence for an effect**, **evidence for the absence of an effect**, or
**absence of evidence** — the data simply being uninformative.

Which one is yours? And does it agree with what you originally concluded — same
story, same direction but different confidence, or meaningfully different? If it
differed, which version do you believe now?

---

## 7 · Write the sentence

Have a go at the two or three sentences you would put in a paper.

---

## For the closing round

Nothing formal — we will just go round the room. Worth having in mind: what
surprised you, what was confusing or awkward or broken, and what you would need
in order to use this in your own work.

The middle one is what we most want to hear.
