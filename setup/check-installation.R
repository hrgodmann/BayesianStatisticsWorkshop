# ---------------------------------------------------------------------------
# Introduction to Bayesian Modeling - installation check
#
# Run this whole script before day 2 of the workshop.
# Select all (Ctrl/Cmd + A) and run (Ctrl/Cmd + Enter), or use
# Ctrl/Cmd + Shift + Enter to source the file.
#
# The model fit at the end compiles Stan code. The FIRST run can take
# 2-5 minutes with no visible progress. This is normal and happens once.
# ---------------------------------------------------------------------------

cat("\n=== Bayesian workshop: installation check ===\n\n")

problems <- character(0)

# --- 1. R version ----------------------------------------------------------

cat("R version:", R.version.string, "\n")
if (getRversion() < "4.3.0") {
  problems <- c(problems, "R is older than 4.3.0 - please update from https://cran.r-project.org")
}

# --- 2. Required packages --------------------------------------------------

required <- c("brms", "bayesplot", "posterior", "loo", "ggplot2", "dplyr")

cat("\nChecking packages:\n")
for (pkg in required) {
  ok <- requireNamespace(pkg, quietly = TRUE)
  cat(sprintf("  %-12s %s\n", pkg, if (ok) "OK" else "MISSING"))
  if (!ok) {
    problems <- c(problems, paste0("Package '", pkg, "' is not installed"))
  }
}

if (length(problems) > 0) {
  cat("\n--- PROBLEMS FOUND ---\n")
  for (p in problems) cat(" *", p, "\n")
  cat("\nInstall missing packages with:\n")
  cat('  install.packages(c("brms", "bayesplot", "posterior", "loo", "ggplot2", "dplyr"))\n\n')
  stop("Installation check failed - see the messages above.", call. = FALSE)
}

# --- 3. Fit a tiny model ---------------------------------------------------

cat("\nFitting a small test model. The first run compiles Stan code and\n")
cat("can take several minutes. Please be patient...\n\n")

suppressMessages(library(brms))

set.seed(2026)
test_data <- data.frame(
  x = rnorm(40),
  g = rep(letters[1:4], each = 10)
)
test_data$y <- 0.5 * test_data$x + rnorm(40, sd = 0.5)

fit <- try(
  brm(
    y ~ x + (1 | g),
    data = test_data,
    chains = 2,
    iter = 500,
    refresh = 0,
    silent = 2
  ),
  silent = TRUE
)

if (inherits(fit, "try-error")) {
  cat("\n--- MODEL FIT FAILED ---\n")
  cat(as.character(fit), "\n")
  cat("\nCopy this ENTIRE message and send it to us before the workshop.\n\n")
  stop("Installation check failed at the model-fitting step.", call. = FALSE)
}

cat("\nModel fitted successfully. Estimated slope:\n")
print(round(fixef(fit)["x", ], 3))

# --- Done ------------------------------------------------------------------

cat("\n=============================\n")
cat("   ALL CHECKS PASSED\n")
cat("=============================\n")
cat("\nYou are ready for the workshop. See you in Giessen.\n\n")
