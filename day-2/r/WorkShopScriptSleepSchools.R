

dat <- read.csv("/Users/henrikgodmann/Desktop/teaching/Workshop/SleepSchools.csv")

# plot data nicely in oldschool style
plot(dat$sleep, dat$score, pch = 16, col = "gray", cex = 0.8,
     xlab = "Standardized Sleep Hours", ylab = "Test Score",
     main = "Simulated Test Scores by Sleep Hours and School")


library(brms)
library(bayesplot)
library(tidybayes)
library(tidyverse)

# Way too narrow prior
priors <- c(
  prior(normal(50, 1), class = "Intercept"),   # baseline score
  prior(normal(0, 5),   class = "b"),            # sleep effect  <- the one that is flat as default
  prior(exponential(0.1), class = "sigma")       # residual SD
)
m2_priorcheck <- brm(
  score ~ sleep + (1 | school), data = dat,
  prior = priors, sample_prior = "only", seed = 1
)
pp_check(m2_priorcheck, ndraws = 100)


# priors adjusted, too wide
priors <- c(
  prior(normal(50, 20), class = "Intercept"),   # baseline score
  prior(normal(0, 5),   class = "b"),            # sleep effect
  prior(exponential(0.1), class = "sigma")       # residual SD
)

# prior pred checks looks good
m2_priorcheck <- brm(
  score ~ sleep + (1 | school), data = dat,
  prior = priors, sample_prior = "only", seed = 1
)
pp_check(m2_priorcheck, ndraws = 50)


# priors adjusted, looks good
priors <- c(
  prior(normal(50, 10), class = "Intercept"),   # baseline score
  prior(normal(0, 5),   class = "b"),            # sleep effect
  prior(exponential(0.1), class = "sigma")       # residual SD
)

# prior pred checks looks good
m2_priorcheck <- brm(
  score ~ sleep + (1 | school), data = dat,
  prior = priors, sample_prior = "only", seed = 1
)
pp_check(m2_priorcheck, ndraws = 50)

# 1. Complete pooling — ignores schools
priors_m1 <- c(
  prior(normal(50, 10),  class = "Intercept"),
  prior(normal(0, 5),   class = "b"),
  prior(exponential(0.1), class = "sigma")
)

m1 <- brm(score ~ sleep, data = dat, seed = 1, prior = priors_m1)
plot(m1)
summary(m1)


# 2. Random intercept — schools differ in baseline
priors_m2 <- c(
  prior(normal(50, 10),  class = "Intercept"),
  prior(normal(0, 5),   class = "b"),
  prior(exponential(0.1), class = "sd"),  # SD of random intercepts
  prior(exponential(0.1), class = "sigma")
)

m2 <- brm(score ~ sleep + (1 | school), data = dat, seed = 1, prior = priors_m2)
plot(m2)
summary(m2)

# posterior predictive checks
dat |>
  add_predicted_draws(m2, ndraws = 100) |>
  ggplot(aes(x = sleep, y = score)) +
  stat_lineribbon(aes(y = .prediction), .width = 0.95, alpha = 0.3) +
  geom_point(alpha = 0.4) +
  facet_wrap(~school) +
  labs(title = "m2 (random intercept only): predicted vs observed, by school",
       subtitle = "Same slope forced on every school — watch for schools where the points tilt against the band")


# 3. Random intercept + random slope — the sleep effect varies by school
priors_m3 <- c(
  prior(normal(50, 10), class = "Intercept"),
  prior(normal(0, 5),   class = "b"),
  prior(exponential(0.1), class = "sd"),   # applies to BOTH sd(Intercept) and sd(sleep)
  prior(lkj(2),         class = "cor"),    # NEW: intercept–slope correlation
  prior(exponential(0.1), class = "sigma")
)
m3 <- brm(score ~ sleep + (1 + sleep | school), data = dat,
          prior = priors_m3, sample_prior = "yes", seed = 1)
plot(m3)
summary(m3)

# Final Result
fixef(m3)
mcmc_areas(m3, pars = "b_sleep", prob = 0.95)   # posterior of the average sleep effect

m3 |>
  gather_draws(b_sleep, prior_b) |>
  mutate(dist = if_else(.variable == "prior_b", "Prior", "Posterior")) |>
  ggplot(aes(x = .value, fill = dist)) +
  stat_halfeye(alpha = 0.6, .width = 0.95) +
  labs(x = "sleep effect (b)", fill = NULL,
       title = "Prior vs posterior for the sleep effect")


# a short journey into model comparison
m1 <- add_criterion(m1, "loo")
m2 <- add_criterion(m2, "loo")
m3 <- add_criterion(m3, "loo")
loo_compare(m1, m2, m3)

# refit with save_pars so bridge sampling works
m2 <- brm(score ~ sleep + (1 | school), data = dat, prior = priors_m2,
          iter = 10000, seed = 1, save_pars = save_pars(all = TRUE))
m3 <- brm(score ~ sleep + (1 + sleep | school), data = dat, prior = priors_m3,
          iter = 10000, seed = 1, save_pars = save_pars(all = TRUE))

bf_32 <- bayes_factor(m3, m2)
bf_32




