# Introduction to Bayesian Modeling

### A Hands-on Workshop for Early-Career Researchers

**Gießen, Germany · <!-- TODO: dates -->TBC** · Two days · Taught in English

Everything you need for the workshop lives in this repository: slides, JASP
files, datasets, worksheets, and the reading list. Nothing here requires a
GitHub account — use the green **Code → Download ZIP** button if you would
rather have the whole thing as a folder.

📄 **Workshop website:** <https://hrgodmann.github.io/BayesianStatisticsWorkshop/>

---

## Before you arrive

Please install the software **before day 1** — we will not have time to
troubleshoot installations during the sessions.

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

| Time | Session | | Lead |
|---|---|---|---|
| 10:00 | **Introduction & peer exchange** | 30 min | Julius |
| 10:30 | **Bayesian basics** — learning cycle, probability, Bayes' theorem | 15 min | Julius |
| 10:45 | **Bayesian estimation** — theory + beta-binomial in JASP | 30 min | Julius |
| 11:15 | *Break* | 15 min | |
| 11:30 | **Bayesian testing** — theory + beta-binomial in JASP | 30 min | Julius |
| 12:00 | **Why bother?** — the benefits of going Bayesian | 20 min | Julius |
| 12:20 | *Lunch* | 45 min | |
| 13:05 | **JASP with real data I** — correlation | 30 min | Henrik |
| 13:35 | **JASP with real data II** — A/B test & *t*-test | 30 min | Henrik |
| 14:05 | *Break* | 15 min | |
| 14:20 | **JASP with real data III** — two proportions | 30 min | Henrik |
| 14:50 | **JASP AI** | 20 min | Henrik |
| 15:10 | **Further reading** | 15 min | Julius & Henrik |
| 15:25 | **Discussion, feedback, outlook to day 2** | 35 min | Julius & Henrik |
| 16:00 | *End* | | |

<sub>Day 1 clock times are provisional — durations are fixed, the start time is <!-- TODO: confirm day 1 start -->to be confirmed.</sub>

📂 Materials: **[day-1/](day-1/README.md)**

---

## Day 2 — Multi-model inference and hierarchical models

From one model to many, then into R for mixed-effects models with `brms`.

| Time | Session | | Lead |
|---|---|---|---|
| 10:00 | **Bayesian multi-model inference** — theory, linear regression & ANOVA in JASP | 75 min | Henrik |
| 11:15 | *Break* | 15 min | |
| 11:30 | **Mixed-effects regression in R with `brms`** — theory, prior & posterior predictive checks, implementation | 120 min | Julius & Henrik |
| 13:30 | *Lunch* | 30 min | |
| 14:00 | **How to report a Bayesian analysis** | 20 min | Julius |
| 14:20 | **Your data, your analysis** — redo your last frequentist analysis | 60 min | Julius & Henrik |
| 15:20 | **Beyond the workshop** — SBC; Stan, `bridgesampling`, `blavaan`, `bsts`, `RoBMA`; further reading | 20 min | Julius & Henrik |
| 15:40 | **Discussion & close** | 20 min | Julius & Henrik |
| 16:00 | *End* | | |

📂 Materials: **[day-2/](day-2/README.md)**

---

## What's in this repository

| Folder | What you'll find |
|---|---|
| [`setup/`](setup/) | Install guide and an installation-check script — start here |
| [`day-1/`](day-1/) | Day 1 slides, JASP files, and datasets |
| [`day-2/`](day-2/) | Day 2 slides, JASP files, R material, and datasets |
| [`bring-your-own-data/`](bring-your-own-data/) | Worksheet for re-analysing your own data on day 2 |
| [`resources/`](resources/) | Reporting checklist and the further-reading list |
| [`docs/`](docs/) | Source of the workshop website |

Slides are uploaded as PDFs shortly before each session; if a folder looks
empty, it will not stay that way.

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

Open an [issue](../../issues) or just ask us in the room. If something in these
materials is broken or unclear after the workshop, an issue is still the best
way to reach us.

## License

Materials are released under [CC BY 4.0](LICENSE) — reuse and adapt them for
your own teaching, with attribution. Code is additionally available under the
MIT License.

If you use these materials, please cite them as:

> Pfadt, J. M., & Godmann, H. R. (2026). *Introduction to Bayesian Modeling:
> A Hands-on Workshop for Early-Career Researchers.* Gießen.
> https://github.com/hrgodmann/BayesianStatisticsWorkshop
