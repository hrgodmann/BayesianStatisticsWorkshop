# Introduction to Bayesian Modeling

### A Hands-on Workshop for Early-Career Researchers

**Gießen, Germany · 17 + 18.09.2026**

Everything you need for the workshop lives in this repository: JASP
files, datasets, and worksheets. Nothing here requires a
GitHub account — use the green **Code → Download ZIP** button if you would
rather have the whole thing as a folder.

---

## Before you arrive

Please install the software **before day 1** — as sometimes troubleshoot installation takes a while. If you have any questions, don't hesitate to send us a mail up front (bayescourse@gmail.com).

➡️ **[setup/README.md](setup/README.md)** — step-by-step install guide for JASP,
R, RStudio and the Stan toolchain, plus a script that checks whether
everything works.

And, if you can: **bring a dataset of your own** — ideally one you have already
analysed with frequentist methods. On day 2 you will re-analyse it the Bayesian
way. See **[bring-your-own-data/](bring-your-own-data/README.md)**.

---

## Day 1 — From Bayes' theorem to real analyses

Estimation, testing, and why any of it is worth your time. All hands-on work in
JASP; no coding required.

| Session | Lead |
|---|---|
| **Introduction & peer exchange** | Julius |
| **Bayesian basics** — learning cycle, probability, Bayes' theorem | Julius |
| **Bayesian estimation** — theory + beta-binomial in JASP | Julius |
| **Bayesian testing** — theory + beta-binomial in JASP | Julius |
| **Why bother?** — the benefits of going Bayesian | Julius |
| **JASP with real data I** — correlation | Henrik |
| **JASP with real data II** — A/B test & *t*-test | Henrik |
| **JASP with real data III** — two proportions | Henrik |
| **JASP AI** | Henrik |
| **Further reading** | Julius & Henrik |
| **Discussion, feedback, outlook to day 2** | Julius & Henrik |

Sessions run in this order, with breaks and lunch along the way.

📂 Materials: **[day-1/](day-1/README.md)**

---

## Day 2 — Multi-model inference and hierarchical models

From one model to many, then into R for mixed-effects models with `brms`.

| Session | Lead |
|---|---|
| **Bayesian multi-model inference** — theory, linear regression & ANOVA in JASP | Henrik |
| **Mixed-effects regression in R with `brms`** — theory, prior & posterior predictive checks, implementation | Julius & Henrik |
| **How to report a Bayesian analysis** | Julius |
| **Your data, your analysis** — redo your last frequentist analysis | Julius & Henrik |
| **Beyond the workshop** — SBC; Stan, `bridgesampling`, `blavaan`, `bsts`, `RoBMA`; further reading | Julius & Henrik |
| **Discussion & close** | Julius & Henrik |

Sessions run in this order, with breaks and lunch along the way.

📂 Materials: **[day-2/](day-2/README.md)**

---

## What's in this repository

| Folder | What you'll find |
|---|---|
| [`setup/`](setup/) | Install guide and an installation-check script — start here |
| [`day-1/`](day-1/) | Day 1 slides, JASP files and datasets |
| [`day-2/`](day-2/) | Day 2 slides, JASP files, R material, and datasets |
| [`bring-your-own-data/`](bring-your-own-data/) | Example datasets |

---

## Instructors

**[Julius M. Pfadt](https://juliuspfadt.com)** — researcher in Eric-Jan
Wagenmakers' lab at the University of Amsterdam and former DFG Walter-Benjamin
fellow. Works on Bayesian statistical modeling, in particular psychometrics,
reliability estimation, and structural equation modeling; develops tools for
JASP and the R package `Bayesrel`; co-founder of JASP Services B.V.
🔗 [juliuspfadt.com](https://juliuspfadt.com)

**[Henrik R. Godmann](https://hrgodmann.github.io)** — PhD candidate at the
Psychological Methods Department of the University of Amsterdam. Works on
robust Bayesian inference, interrupted and non-linear time series, state-space
models, and statistical software for applied researchers; contributes to JASP;
co-founder of JASP Services B.V.
🔗 [hrgodmann.github.io](https://hrgodmann.github.io) ·
[github.com/hrgodmann](https://github.com/hrgodmann)

---

## Software we use

| | |
|---|---|
| **[JASP](https://jasp-stats.org)** | Free, open-source, point-and-click. Most of the workshop happens here. |
| **[R](https://cran.r-project.org)** + **[RStudio](https://posit.co/download/rstudio-desktop/)** | For the `brms` session on day 2. |
| **[`brms`](https://paulbuerkner.com/brms/)** / **[Stan](https://mc-stan.org)** | Hierarchical and mixed-effects models. |

---

## Questions during the workshop

Ask us! Or send us an email (bayescourse@gmail.com). If something in these
materials is broken or unclear after the workshop, an email is still the best
way to reach us.

## License

Materials are released under [CC BY 4.0](LICENSE) — reuse and adapt them for
your own teaching, with attribution. Code is additionally available under the
MIT License.

If you use these materials, please cite them as:

> Pfadt, J. M., & Godmann, H. R. (2026). *Introduction to Bayesian Modeling:
> A Hands-on Workshop for Early-Career Researchers.* Gießen.
> https://github.com/hrgodmann/BayesianStatisticsWorkshop
