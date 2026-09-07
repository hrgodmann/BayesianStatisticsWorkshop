# How to report a Bayesian analysis

A one-page checklist to take into your next manuscript. Based on the JASP
reporting guidelines (van Doorn et al., 2021) and the WAMBS checklist
(Depaoli & van de Schoot, 2017).

The principle behind all of it: **a reader should be able to reconstruct what
you did and judge whether your conclusion follows.** If a bullet below does not
apply to your analysis, skip it — but know why you are skipping it.

[← back to the main page](../README.md)

---

## Before you analyse

- [ ] State the **hypotheses** you are comparing, in words and in model terms.
      A Bayes factor is always a comparison *between two specific models* — name them.
- [ ] Decide whether the goal is **estimation** ("how large is the effect?") or
      **testing** ("is there an effect at all?"). Report accordingly. Many
      analyses want both.
- [ ] Note whether the analysis is **confirmatory or exploratory**. Say so in
      the paper. Pre-registration helps but is not required for the analysis to
      be honest.

## Priors

- [ ] **Report every prior**, including the ones you left at their defaults —
      and name the default (e.g. "JASP's default Cauchy prior on effect size,
      scale 0.707").
- [ ] **Justify the choice**, briefly. "Default" is a legitimate justification;
      so is "informed by Smith et al. (2019)". Silence is not.
- [ ] For informed priors, show or describe the **prior distribution** itself.
- [ ] Consider a **prior predictive check**: does the prior generate data that
      could plausibly have come from your field?

## Computation (for MCMC-based analyses)

- [ ] Report **software and version** — R version, `brms` version, Stan version,
      or the JASP version.
- [ ] Report the number of **chains, iterations, and warmup**.
- [ ] Report **convergence diagnostics**: R-hat (should be ≤ 1.01) and effective
      sample size (bulk and tail ESS).
- [ ] Report any **divergent transitions**, and what you did about them.
      Divergences are not cosmetic — a fit with divergences may be wrong.
- [ ] Include a **posterior predictive check**: does the fitted model generate
      data that look like your data?

## Results — estimation

- [ ] Report the **posterior median or mean** of the parameters of interest.
- [ ] Report a **credible interval** (state the mass — usually 95% — and the type:
      central or highest-density).
- [ ] Interpret it as a credible interval: *given the model and the data, there
      is a 95% probability the parameter lies in this range.* Do not describe it
      as a confidence interval.
- [ ] Show the **posterior distribution** where you can. A plot says more than
      two numbers.

## Results — testing

- [ ] Report the **Bayes factor with an explicit direction and subscript**:
      BF₁₀ = 12.4 (evidence for H₁ over H₀), or BF₀₁ = 5.2 (evidence for H₀).
      An unlabelled "BF = 12.4" is ambiguous.
- [ ] Interpret the size of the evidence in words, but **do not threshold it**.
      There is no Bayesian .05. "Moderate evidence for H₁" is a description,
      not a verdict.
- [ ] Distinguish clearly between:
      - **evidence for an effect** (BF₁₀ ≫ 1),
      - **evidence for the absence of an effect** (BF₁₀ ≪ 1),
      - **absence of evidence** (BF₁₀ ≈ 1 — the data are uninformative).
      This distinction is the single most common reporting failure.
- [ ] Report **prior and posterior model probabilities** if you did model
      comparison across more than two models.
- [ ] For multi-model inference, report **inclusion Bayes factors** and say
      whether they are across the full model space or across matched models.

## Robustness

- [ ] Run a **prior sensitivity analysis** — how does the conclusion change
      under a wider or narrower prior? Report the result even if nothing
      changes, especially if the Bayes factor is near 1.
- [ ] If you stopped data collection based on the evidence (which is allowed
      under a Bayesian analysis), **say so** and report the **sequential
      analysis** plot.

## Transparency

- [ ] Share the **data** and the **analysis file** — a `.jasp` file or an R
      script — in a public repository (OSF, GitHub) and link to it.
- [ ] State the **seed** for anything stochastic.
- [ ] Report analyses you ran and **did not** report in the main text.

---

## A worked sentence

> We compared a model with an effect of condition against the null model using
> a default Cauchy prior on effect size (scale 0.707), as implemented in JASP
> 0.19. The data provided moderate evidence for the alternative hypothesis,
> BF₁₀ = 6.1. The posterior median effect size was δ = 0.42, 95% credible
> interval [0.09, 0.76]. A robustness check across Cauchy prior scales from
> 0.5 to 1.5 yielded Bayes factors between 4.8 and 6.4, so the conclusion does
> not hinge on the prior width. Data and the annotated `.jasp` file are
> available at <osf.io/xxxxx>.

Four sentences. Hypotheses, prior, evidence, estimate, robustness, and the
material. That is the whole job.

---

### Sources

- van Doorn, J., et al. (2021). The JASP guidelines for conducting and reporting a Bayesian analysis. *Psychonomic Bulletin & Review, 28*(3), 813–826.
- Depaoli, S., & van de Schoot, R. (2017). Improving transparency and replication in Bayesian statistics: The WAMBS-Checklist. *Psychological Methods, 22*(2), 240–261.
- Kruschke, J. K. (2021). Bayesian analysis reporting guidelines. *Nature Human Behaviour, 5*(10), 1282–1291.
