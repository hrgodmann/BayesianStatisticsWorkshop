## Food ratings: your turn

## Hackel et al. (2018), Study 1: https://doi.org/10.1016/j.jesp.2017.09.007
## Original data/code: https://osf.io/d2ytu/

## 0. Setup

library(brms)
library(posterior)
library(ggplot2)

set.seed(2026)
ITER   <- 4000
WARMUP <- 1000
CHAINS <- 4

# Use up to four cores, leaving one free when possible.
available_cores <- parallel::detectCores()
if (is.na(available_cores)) available_cores <- 1L
options(mc.cores = max(1L, min(CHAINS, available_cores - 1L)))

# Use ITER, WARMUP, CHAINS and seed = 2026 in your fits.
# If you run MCMC, check trace plots (big fat hairy caterpillar plots),
# Rhat < 1.01, bulk/tail ESS >= 400 and no divergences.
# Ask for help if diagnostics fail.

## 1. Data preparation

# Adjust data path to where you saved the data.
data_path <- "brmsFoodData.csv"

# This you can then just run (it is data wrangling that we don't need to waste time on)
dat <- read.csv(data_path)
dat$row_id <- seq_len(nrow(dat))
dat$SubNum <- factor(dat$SubNum)
dat$Food <- factor(dat$Trial)
dat$Tastiness[is.nan(dat$Tastiness)] <- NA_real_
dat$SouthernnessMean <- ave(dat$Southernness, dat$SubNum)
dat$SouthernnessC <- dat$Southernness - dat$SouthernnessMean
dat$IDC <- dat$IDAll - mean(dat$IDAll)
dat$TastinessOrd <- factor(dat$Tastiness, levels = 1:7, ordered = TRUE)

missing_rows <- which(is.na(dat$Tastiness))
dat_observed <- dat[!is.na(dat$Tastiness), ]
dat_missing <- dat[is.na(dat$Tastiness), ]
head(dat)

# The dat contains 79 participants rating 24 foods; one tastiness rating is missing.
# SubNum is a grouping ID; Tastiness is the expected tastiness rating from 1 to 7.
# SouthernnessC is centered consensus Southernness; IDC is centered Southern identification.
# dat_observed excludes the missing rating; dat_missing contains that one row.

## 2. Task 1: Always plot your data, and then fit the simple pooled model

# 1) Plot Tastiness against SouthernnessC.
# 2) Find out how to choose priors in brms, and choose a set of simple Gaussian priors that make
# sense in your eyes (don't overthink it :-) ) Save the priors as priors_gaussian.
# 3) Fit a simple regression, where you regress Tastiness on SouthernnessC and IDC,
# no random effects needed yet. Use dat with mi() for the missing response.
# Save the fit as m_naive.
# The next comment line contains a few hints, but you can also find the help pages
# for the functions in R, for instance when running ?brm for brms's main function.
# 4) Check also convergence of the MCMC procedure.



# Hints: plot(), prior(), brm(), mi(), summary(), fixef().
# Hints about mi(): put it into a formula were missings are in the response as such:
# Tastiness | mi() ~ SouthernnessC + IDC

# Your code:




## 3. Task 2: We should add participant intercepts, as people might differ in their baseline ratings.

# 1) Add a varying intercept for SubNum; keep the shared priors unchanged and
# add a prior for the participant SD. Save as m_intercept with priors_intercept.
# 2) Compare the main effect of identification (IDC) and its uncertainty with m_naive.
# What changed? (You can reprint the summary() of both models to compare the estimates
# and their 95% credible intervals.) Why aren't 24 ratings from one person 24 people?

# Your code:


## 4. Task 3: Let's do some Prior predictive checks. This, you would of course do
# before fitting the model, but we do it here for illustration. Can you find out how to
# just sample from the prior in brms? Compare narrow and wide priors on the intercept.
# Are your chosen priors plausible?

# 1) Fit a prior-only version of m_intercept using dat_observed and WITHOUT mi().
# Plot the predicted ratings. How much probability lies outside the 1-7 scale?
# Missing responses cannot be sampled with mi() when the likelihood is switched off.

# Your code:



## 5. Task 4: Let's add the interaction and varying slopes for Southernness. The full model!

# 1) Add the IDC-by-SouthernnessC interaction, keeping both main effects and participant
# intercepts. Save as m_full_gaussian. Does Southern identification change the relationship
# between a food's Southernness and its expected tastiness?
# 2) Now let SouthernnessC slopes differ by participant and correlate with intercepts.
# Specify SD/LKJ priors; save as m_slope with sample_prior = "yes".
# Plot the posterior distribution for the interaction. What changed compared to
# m_full_gaussian? (You can reprint both summaries to compare the credible intervals.)
# If you want to be fancy (and cool), plot the prior and posterior together to see
# what we've learned :)



# Your code:



## Extra special tasks if you are fast :)

# Posterior predictive check: does the Gaussian model predict ratings outside 1-7?
# Try an ordinal model for TastinessOrd with cumulative("logit") on dat_observed,
# without mi(). Choose latent-scale/threshold priors and save as m_ord.
# Check prior/posterior category frequencies. The slopes now use a log-odds scale;
# do not directly compare Gaussian and ordinal coefficients or LOO scores.

# Your code:


# If you are the fastest student ever, find the posterior for the missing rating!
# Extract Ymi[row] draws from m_slope (row is given by missing_rows) and plot them.
# If you fitted m_ord, predict dat_missing with re_formula = NULL. What is the difference
# between posterior_epred() and posterior_predict()? Hints: as_draws_df(), names().
# Optionally fill a separate, flagged column in a copy of dat. Keep the original and
# all draws: one imputation is not an observed value. We assume ignorable missingness.

# Your code:
