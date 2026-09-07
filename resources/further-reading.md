# Further reading

A curated list, not an exhaustive one. Start at the top.

[← back to the main page](../README.md)

---

## Start here

If you read only two things after the workshop, read these:

- **Wagenmakers, E.-J., Marsman, M., Jamil, T., Ly, A., Verhagen, J., Love, J., … Morey, R. D. (2018).** Bayesian inference for psychology. Part I: Theoretical advantages and practical ramifications. *Psychonomic Bulletin & Review, 25*(1), 35–57.
- **Wagenmakers, E.-J., Love, J., Marsman, M., Jamil, T., Ly, A., Verhagen, J., … Morey, R. D. (2018).** Bayesian inference for psychology. Part II: Example applications with JASP. *Psychonomic Bulletin & Review, 25*(1), 58–76.

Part I is the argument; Part II is the walkthrough. Together they cover most of
day 1.

- **van Doorn, J., van den Bergh, D., Böhm, U., Dablander, F., Derks, K., Draws, T., … Wagenmakers, E.-J. (2021).** The JASP guidelines for conducting and reporting a Bayesian analysis. *Psychonomic Bulletin & Review, 28*(3), 813–826.

The reporting standard we use in [`reporting-checklist.md`](reporting-checklist.md).

---

## Textbooks

- **McElreath, R. (2020).** *Statistical Rethinking: A Bayesian Course with Examples in R and Stan* (2nd ed.). CRC Press.
  The one most people recommend, and rightly so. Lectures are on
  [YouTube](https://www.youtube.com/@rmcelreath) and are excellent on their own.
- **Kruschke, J. K. (2015).** *Doing Bayesian Data Analysis: A Tutorial with R, JAGS, and Stan* (2nd ed.). Academic Press.
  Gentler, very thorough, psychology-oriented.
- **Lee, M. D., & Wagenmakers, E.-J. (2013).** *Bayesian Cognitive Modeling: A Practical Course*. Cambridge University Press.
  Short, example-driven, aimed squarely at psychologists.
- **Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013).** *Bayesian Data Analysis* (3rd ed.). CRC Press.
  The reference. Free PDF at <https://sites.stat.columbia.edu/gelman/book/>.

---

## Bayes factors and hypothesis testing

- **Etz, A., & Vandekerckhove, J. (2018).** Introduction to Bayesian inference for psychology. *Psychonomic Bulletin & Review, 25*(1), 5–34.
- **Rouder, J. N., Speckman, P. L., Sun, D., Morey, R. D., & Iverson, G. (2009).** Bayesian *t* tests for accepting and rejecting the null hypothesis. *Psychonomic Bulletin & Review, 16*(2), 225–237.
- **Dienes, Z. (2014).** Using Bayes to get the most out of non-significant results. *Frontiers in Psychology, 5*, 781.
- **Keysers, C., Gazzola, V., & Wagenmakers, E.-J. (2020).** Using Bayes factor hypothesis testing in neuroscience to establish evidence of absence. *Nature Neuroscience, 23*(7), 788–799.
  The clearest treatment of *evidence of absence* vs. *absence of evidence*.
- **Hoijtink, H., Mulder, J., van Lissa, C., & Gu, X. (2019).** A tutorial on testing hypotheses using the Bayes factor. *Psychological Methods, 24*(5), 539–556.

## Estimation and "the new statistics"

- **Kruschke, J. K., & Liddell, T. M. (2018).** The Bayesian New Statistics: Hypothesis testing, estimation, meta-analysis, and power analysis from a Bayesian perspective. *Psychonomic Bulletin & Review, 25*(1), 178–206.
- **Morey, R. D., Hoekstra, R., Rouder, J. N., Lee, M. D., & Wagenmakers, E.-J. (2016).** The fallacy of placing confidence in confidence intervals. *Psychonomic Bulletin & Review, 23*(1), 103–123.

## Multi-model inference and model averaging

- **Hinne, M., Gronau, Q. F., van den Bergh, D., & Wagenmakers, E.-J. (2020).** A conceptual introduction to Bayesian model averaging. *Advances in Methods and Practices in Psychological Science, 3*(2), 200–215.
- **van den Bergh, D., van Doorn, J., Marsman, M., Draws, T., van Kesteren, E.-J., Derks, K., … Wagenmakers, E.-J. (2020).** A tutorial on conducting and interpreting a Bayesian ANOVA in JASP. *L'Année psychologique, 120*(1), 73–96.

## Multilevel models with brms

- **Bürkner, P.-C. (2017).** brms: An R package for Bayesian multilevel models using Stan. *Journal of Statistical Software, 80*(1), 1–28.
- **Bürkner, P.-C. (2018).** Advanced Bayesian multilevel modeling with the R package brms. *The R Journal, 10*(1), 395–411.
- **brms documentation and vignettes** — <https://paulbuerkner.com/brms/>
  Genuinely good documentation; the vignettes are the fastest way in.

## Workflow, priors, and model checking

- **Gelman, A., Vehtari, A., Simpson, D., Margossian, C. C., Carpenter, B., Yao, Y., … Modrák, M. (2020).** Bayesian workflow. [arXiv:2011.01808](https://arxiv.org/abs/2011.01808)
- **Schad, D. J., Betancourt, M., & Vasishth, S. (2021).** Toward a principled Bayesian workflow in cognitive science. *Psychological Methods, 26*(1), 103–126.
- **Depaoli, S., & van de Schoot, R. (2017).** Improving transparency and replication in Bayesian statistics: The WAMBS-Checklist. *Psychological Methods, 22*(2), 240–261.
- **Stan prior choice recommendations** — <https://github.com/stan-dev/stan/wiki/Prior-Choice-Recommendations>

## Simulation-based calibration

- **Talts, S., Betancourt, M., Simpson, D., Vehtari, A., & Gelman, A. (2018).** Validating Bayesian inference algorithms with simulation-based calibration. [arXiv:1804.06788](https://arxiv.org/abs/1804.06788)
- **Modrák, M., Moon, A. H., Kim, S., Bürkner, P.-C., Huurre, N., Faltejsková, K., Gelman, A., & Vehtari, A. (2023).** Simulation-based calibration checking for Bayesian computation: The choice of test quantities shapes sensitivity. *Bayesian Analysis*.
- **`SBC` R package** — <https://hyunjimoon.github.io/SBC/>

---

## Software

| | |
|---|---|
| [JASP](https://jasp-stats.org) | Point-and-click Bayesian (and frequentist) statistics |
| [Stan](https://mc-stan.org) | The engine underneath `brms` |
| [`brms`](https://paulbuerkner.com/brms/) | Bayesian multilevel models with R formula syntax |
| [`bridgesampling`](https://cran.r-project.org/package=bridgesampling) | Marginal likelihoods and Bayes factors for Stan models |
| [`blavaan`](https://ecmerkle.github.io/blavaan/) | Bayesian structural equation modeling |
| [`bsts`](https://cran.r-project.org/package=bsts) | Bayesian structural time series |
| [`RoBMA`](https://fbartos.github.io/RoBMA/) | Robust Bayesian meta-analysis |
| [`Bayesrel`](https://cran.r-project.org/package=Bayesrel) | Bayesian reliability estimation |
| [`bayesplot`](https://mc-stan.org/bayesplot/) | Posterior and predictive-check plots |
| [`loo`](https://mc-stan.org/loo/) | Model comparison via approximate leave-one-out CV |

---

## Communities

- [Stan Forums](https://discourse.mc-stan.org) — the place to ask modeling questions; the developers answer
- [JASP support](https://jasp-stats.org/support/) and the [JASP GitHub](https://github.com/jasp-stats)
