# ---------------------------------------------------------------------------
# How ego-depletion.csv was built.
#
# You do not need to run this. It is here so the derivation from the original
# OSF files is on the record. Needs the `haven` package.
#
# Source: Hagger, M. S., Chatzisarantis, N. L. D., et al. (2016). A multilab
#   preregistered replication of the ego-depletion effect. Perspectives on
#   Psychological Science, 11(4), 546-573.
# Data:   https://osf.io/jymhe/
# ---------------------------------------------------------------------------

library(haven)
out_dir <- "."                      # run with the working directory set here
cache   <- file.path(tempdir(), "rrr"); dir.create(cache, showWarnings = FALSE)

# --- 1 · the merged subject-level file -------------------------------------
main <- file.path(cache, "RRR-MergedSubjectData.csv")
if (!file.exists(main)) download.file("https://osf.io/download/t3mns/", main, mode = "wb", quiet = TRUE)
d <- read.csv(main, stringsAsFactors = FALSE)

# Exclusions == 1 is the analysis sample reported in the paper.
a <- subset(d, Exclusions == 1)
stopifnot(nrow(a) == 2141)

# --- 2 · post-task ratings, from each lab's own SPSS file -------------------
# The merged file above kept the ratings for only 9 of the 23 labs, because
# every lab named its columns differently. The per-lab .sav files have them
# all, so pull them from there and match on the two reaction-time values,
# which together identify a participant uniquely.
sav_urls <- c(
  Birt="u5ec4", Brandt="3squw", Brewer="tpdfe", Calvillo="ea6xd", Carruth="vj4xe",
  Cheung="6ntbz", Crowell="udfqk", Elson="2n6gv", Evans="pwvmd", Francis="w6u75",
  Hagger="uz35s", Lange="mkvyp", Otgaar="h8ag4", Philipp="4zjsk", Rentzsch="f7zve",
  Ringos="gdnmf", Schlinkert="sn2b7", Stamos="bv9tz", Ullrich="x52zw",
  VanDellen="ju3p6", Wolff="rq8hw", Yusainy="hwjga", Zerhouni="kd6h7")

first_match <- function(nm, pat) { h <- nm[grepl(pat, nm, ignore.case = TRUE)]; if (length(h)) h[1] else NA }

ratings <- do.call(rbind, lapply(names(sav_urls), function(lab) {
  f <- file.path(cache, paste0(lab, ".sav"))
  if (!file.exists(f)) download.file(paste0("https://osf.io/download/", sav_urls[lab], "/"),
                                     f, mode = "wb", quiet = TRUE)
  s  <- read_sav(f); nm <- names(s)
  # "^eff$" etc. catch the labs that abbreviated; note Hagger's typo "diffculty".
  col <- function(pat) { cc <- first_match(nm, pat)
                         if (is.na(cc)) rep(NA_real_, nrow(s)) else suppressWarnings(as.numeric(s[[cc]])) }
  cC <- first_match(nm, "^C_1_MeanRT"); cI <- first_match(nm, "^I_1_MeanRT")
  data.frame(key = paste(round(as.numeric(s[[cC]]), 9), round(as.numeric(s[[cI]]), 9)),
             effort      = col("effort|^eff$"),
             difficulty  = col("difficult|diffcult|diffic|^dif$"),
             tiredness   = col("tired|fatig|^tir$"),
             frustration = col("frust|^fru$"), stringsAsFactors = FALSE)
}))
ratings <- ratings[!duplicated(ratings$key), ]

# All four are 1-7 scales. Anything above that is a missing-data code
# (Rentzsch used 25), so blank it out rather than let it through as a score.
for (v in c("effort", "difficulty", "tiredness", "frustration")) {
  ratings[[v]][ratings[[v]] > 7 | ratings[[v]] < 1] <- NA
}

# --- 3 · assemble ----------------------------------------------------------
a$key <- paste(round(a$C_1_MeanRT.MSIT, 9), round(a$I_1_MeanRT.MSIT, 9))
stopifnot(!any(duplicated(a$key)))
# The merged CSV already has sparse columns by these names -- drop them so the
# ones pulled from the .sav files are what actually lands in the output.
a <- a[, !names(a) %in% c("effort", "difficulty", "tiredness", "frustration",
                          "Effort", "Difficulty", "Tiredness", "Frustration")]
a <- merge(a, ratings, by = "key", all.x = TRUE)
stopifnot(sum(!is.na(a$effort)) > 2000)

# Task "H" = hard version of the letter-e task = depletion; "E" = easy = control.
out <- data.frame(
  id              = sprintf("S%04d", seq_len(nrow(a))),
  lab             = sub(".csv", "", sub("BDEC_Results_Full_", "", a$Site, fixed = TRUE), fixed = TRUE),
  condition       = factor(ifelse(a$Task == "H", "depletion", "control"), levels = c("control", "depletion")),
  lang_group      = factor(a$LangGroup, levels = c("English", "NonEnglish")),
  rt_congruent    = round(a$C_1_MeanRT.MSIT, 4),
  rt_incongruent  = round(a$I_1_MeanRT.MSIT, 4),
  acc_congruent   = round(a$Acc.C.MSIT, 4),
  acc_incongruent = round(a$Acc.I.MSIT, 4),
  interference    = round(a$TrialTypeEffect_Mean.MSIT, 4),
  effort          = a$effort,
  difficulty      = a$difficulty,
  tiredness       = a$tiredness,
  frustration     = a$frustration,
  stringsAsFactors = FALSE
)
out <- out[order(out$lab, out$id), ]
out$id <- sprintf("S%04d", seq_len(nrow(out)))   # renumber after sorting

write.csv(out, file.path(out_dir, "ego-depletion.csv"), row.names = FALSE)
message("N = ", nrow(out), " | labs = ", length(unique(out$lab)),
        " | ratings present for ", sum(!is.na(out$effort)))
