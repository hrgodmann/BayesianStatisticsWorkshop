# ---------------------------------------------------------------------------
# NOT FOR PARTICIPANTS -- the answers, so you know what they should be finding
# when you are walking around. Delete this file if you would rather it were not
# in the repo.
#
# Needs BayesFactor (not in the workshop setup) and brms (is).
# ---------------------------------------------------------------------------

library(BayesFactor)
w <- read.csv("ego-depletion.csv", stringsAsFactors = FALSE)
w$condition <- factor(w$condition, levels = c("control", "depletion"))

# --- what they should get in JASP ------------------------------------------
# t-tests: frequentist p, then BF10
#   interference   p = .057        BF10 = 0.29   (BF01 = 3.4)   evidence for H0
#   tiredness      p = .104        BF10 = 0.18   (BF01 = 5.4)   evidence for H0
#   effort         p = 8e-60       BF10 = 7.5e54
#   frustration    p = 3e-62       BF10 = 1.8e60
#   difficulty     p = 2e-252      BF10 = 8.2e265
for (v in c("interference", "tiredness", "effort", "frustration", "difficulty")) {
  s <- w[!is.na(w[[v]]), ]
  f <- as.formula(paste(v, "~ condition"))
  cat(sprintf("%-12s p = %-10.3g BF10 = %.4g\n", v,
      t.test(f, data = s)$p.value, extractBF(ttestBF(formula = f, data = s))$bf))
}

# correlations with interference -- note tiredness: p = .039 but BF10 = 0.43.
# Significant and inconclusive at the same time. The best thing in the dataset.
#   acc_congruent  r = -.004  p = .84    BF01 = 19.3
#   effort         r = +.005  p = .83    BF01 = 18.9
#   difficulty     r = +.033  p = .14    BF01 =  6.5
#   tiredness      r = +.046  p = .039   BF01 =  2.3
#   rt_congruent   r = -.118  p = 5e-08  BF10 = 1.5e5
for (v in c("acc_congruent", "effort", "difficulty", "tiredness", "rt_congruent")) {
  ok <- complete.cases(w$interference, w[[v]])
  cat(sprintf("%-14s r = %+.3f  p = %-9.3g BF10 = %.4g\n", v,
      cor(w$interference[ok], w[[v]][ok]),
      cor.test(w$interference[ok], w[[v]][ok])$p.value,
      extractBF(correlationBF(w$interference[ok], w[[v]][ok]))$bf))
}

# --- per-lab: the point of the whole thing ---------------------------------
# 2 labs find it, 10 inconclusive, 11 evidence of absence.
per_lab <- do.call(rbind, lapply(sort(unique(w$lab)), function(l) {
  s <- w[w$lab == l, ]
  data.frame(lab = l, n = nrow(s),
             BF10 = extractBF(ttestBF(formula = interference ~ condition, data = s))$bf)
}))
per_lab$verdict <- with(per_lab, ifelse(BF10 > 3, "for depletion",
                                 ifelse(BF10 < 1/3, "for the null", "inconclusive")))
print(per_lab[order(-per_lab$BF10), ], row.names = FALSE, digits = 3)
table(per_lab$verdict)

# --- the mixed model -------------------------------------------------------
# interference ~ condition + (1 | lab):  conditiondepletion = -0.01 [-0.01, 0.00]
#   sd(Intercept) ~ 0.02, max Rhat 1.005, ~25 s after compile.
# P(effect > 0) = .05 ; P(|effect| < 10 ms) = .86
library(brms)
priors <- c(prior(normal(0.3, 0.2), class = "Intercept"), prior(normal(0, 0.1), class = "b"),
            prior(exponential(10), class = "sd"), prior(exponential(10), class = "sigma"))
m <- brm(interference ~ condition + (1 | lab), data = w, prior = priors,
         chains = 4, cores = 4, iter = 2000, seed = 1, refresh = 0)
summary(m)
eff <- as_draws_df(m)$b_conditiondepletion
c(p_positive = mean(eff > 0), p_under_10ms = mean(abs(eff) < 0.01))
