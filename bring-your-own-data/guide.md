# Guide — your data, your analysis

Take the last frequentist analysis you ran and run it again as a Bayesian
analysis. Skip any step that does not apply to your case, and ask us when you
get stuck.

[← back to the session page](README.md)

---

## 1 · Start from what you have

Note what was measured and on whom, which test you ran, and what you reported:
the test statistic, the *p*-value, the effect size, the confidence interval.

Then write down the conclusion you drew, in words. Step 6 comes back to it.

---

## 2 · State the two hypotheses

A Bayes factor compares two models, so both have to be explicit. What does "no
effect" mean here? What does "an effect" mean, and how large would you expect
it to be?

> If H₁ is hard to specify, that is itself informative. It usually means the
> original analysis tested against a null without a clear alternative in mind.

---

## 3 · Choose a prior

A default prior and an informed prior are both defensible. What matters is
being able to say afterwards which you used.

If you take the default, read from the JASP output what that default actually
is; you will need it for a write-up. If you set an informed prior, be ready to
say what it rests on: a previous study, a meta-analysis, or theory.

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
| Mixed model | `brms` in R — ask one of us |

Record the Bayes factor, the posterior median, the 95% credible interval, and
whether convergence looked healthy.

---

## 5 · Check that it holds

Vary the prior width and see whether the conclusion survives. This matters most
when the Bayes factor is close to 1.

Then look at the posterior itself. Is it narrow or wide? Symmetric? Does it
exclude zero, and by how much?

---

## 6 · Interpret

Three outcomes are possible, and distinguishing them is the point of the
exercise: evidence for an effect, evidence for the absence of an effect, and
absence of evidence, where the data are simply uninformative.

Which is yours? Does it agree with what you originally concluded — the same
result, the same direction with different confidence, or something meaningfully
different? If the two differ, which do you now believe?

---

## 7 · Write the sentence

Draft the two or three sentences you would put in a paper.

---

## For the closing round

We will go round the room informally, two or three minutes each. Worth having
in mind: what surprised you, what was confusing or did not work, and what you
would need in order to use this in your own research.

The second of those is the most useful to us.
