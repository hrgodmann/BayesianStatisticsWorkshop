# ---------------------------------------------------------------------------
# NOT FOR PARTICIPANTS -- the answers, so you know what they should be finding.
# Needs BayesFactor (not in the workshop setup).
# ---------------------------------------------------------------------------

library(BayesFactor)
d <- read.csv("college-success.csv")
d <- d[, c("gpa", "hsm", "hss", "hse", "satm", "satv")]

bf   <- regressionBF(gpa ~ hsm + hss + hse + satm + satv, data = d, progress = FALSE)
b    <- extractBF(bf)$bf
nms  <- rownames(extractBF(bf))
post <- b / sum(b)                       # equal prior over the 32 models

# --- option 1: the four "n.s." predictors are NOT equivalent ----------------
# Frequentist p / Bayesian BF_exclusion:
#   hsm    p < .001   BF_inclusion = 3516     overwhelming, belongs
#   hse    p = .164   BF_exclusion =  1.71    nothing either way
#   satm   p = .170   BF_exclusion =  3.31    moderate evidence against
#   hss    p = .343   BF_exclusion =  2.41    anecdotal against
#   satv   p = .492   BF_exclusion =  5.66    moderate evidence against
#
# Note hse and satm have nearly identical p-values (.164, .170) and quite
# different Bayes factors. That is the point of option 1.
for (v in c("hsm", "hss", "hse", "satm", "satv")) {
  has <- grepl(paste0("\\b", v, "\\b"), nms)
  inc <- sum(post[has]) / sum(post[!has])
  cat(sprintf("%-6s BF_inclusion = %9.3f   BF_exclusion = %6.2f\n", v, inc, 1 / inc))
}

# --- option 2: do the SAT scores earn their place? -------------------------
# hsm alone vs hsm + satm + satv:  BF = 24.7 in favour of dropping them.
cat("\nhsm vs hsm + SAT:  BF =",
    round(b[nms == "hsm"] / b[nms == "hsm + satm + satv"], 1), "\n")

# --- option 3: model uncertainty -------------------------------------------
# Best model is hsm ALONE, and it still only gets ~30% of the posterior.
# Top four together are only ~68%. Nothing is "the" model -> model averaging.
o <- order(-post)
cat("\ntop models:\n")
for (i in o[1:5]) cat(sprintf("  %-28s BF10 = %9.3g  P(M|data) = %.3f\n", nms[i], b[i], post[i]))
cat("best vs full model: BF =", round(b[o[1]] / b[nms == "hsm + hss + hse + satm + satv"], 1), "\n")

# --- option 4: prior sensitivity -------------------------------------------
# rscaleCont default is "medium" (= sqrt(2)/4). hsm survives everything;
# the ordering of the weak predictors is what moves.
for (r in c("medium", "wide", "ultrawide")) {
  bb <- regressionBF(gpa ~ hsm + hss + hse + satm + satv, data = d,
                     rscaleCont = r, progress = FALSE)
  e  <- extractBF(bb)$bf; p <- e / sum(e); n <- rownames(extractBF(bb))
  cat(sprintf("\nrscale = %-10s best = %-12s P = %.3f\n", r, n[which.max(p)], max(p)))
}
