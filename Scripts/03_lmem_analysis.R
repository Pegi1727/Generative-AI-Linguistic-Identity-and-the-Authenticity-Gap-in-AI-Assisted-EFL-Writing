# ==============================================================================
# Script 03: Linear Mixed-Effects Models (LMEM)
# Study: Authenticity Gap in AI-Assisted Academic Writing
# Lead Researcher: Dr. Pegah Merrikhi
# ==============================================================================

required_pkgs <- c("tidyverse", "lme4", "lmerTest", "readr")
new_pkgs <- required_pkgs[!(required_pkgs %in% installed.packages()[, "Package"])]
if(length(new_pkgs)) install.packages(new_pkgs, dependencies = TRUE)

suppressPackageStartupMessages({
  library(tidyverse)
  library(lme4)
  library(lmerTest)
  library(readr)
})

lmem_data <- read_csv("lmem_full_data.csv", show_col_types = FALSE)

cat("==============================================\n")
cat("LINEAR MIXED-EFFECTS MODELS (LMEM)\n")
cat("Formula: Outcome ~ Condition * CEFR + AI_Exp + (1 + Condition | Participant)\n")
cat("==============================================\n\n")

cat("--- [Model 1] MTLD Lexical Diversity ---\n")
m_mtld <- lmer(
  MTLD_Lexical_Diversity ~ Condition_Code * CEFR_Numeric + AI_Experience_Months + (1 + Condition_Code | Participant_ID),
  data = lmem_data
)
print(summary(m_mtld))

cat("\n--- [Model 2] Grammar Errors ---\n")
m_grammar <- lmer(
  Grammar_Errors ~ Condition_Code * CEFR_Numeric + AI_Experience_Months + (1 + Condition_Code | Participant_ID),
  data = lmem_data
)
print(summary(m_grammar))

cat("\n--- [Model 3] Authorial Stance Markers ---\n")
m_stance <- lmer(
  Stance_Markers_Per_100w ~ Condition_Code * CEFR_Numeric + AI_Experience_Months + (1 + Condition_Code | Participant_ID),
  data = lmem_data
)
print(summary(m_stance))
