# ==============================================================================
# Script 01: Exploratory Data Analysis & Scale Psychometrics (AGS)
# Study: Authenticity Gap in AI-Assisted Academic Writing
# Lead Researcher: Dr. Pegah Merrikhi (pegah.merrikhiii@gmail.com)
# ==============================================================================

required_pkgs <- c("tidyverse", "psych", "readr", "ggplot2")
new_pkgs <- required_pkgs[!(required_pkgs %in% installed.packages()[, "Package"])]
if(length(new_pkgs)) install.packages(new_pkgs, dependencies = TRUE)

suppressPackageStartupMessages({
  library(tidyverse)
  library(psych)
  library(readr)
  library(ggplot2)
})

# 1. Load Data
participants <- read_csv("participants.csv", show_col_types = FALSE)
ags_items <- read_csv("ags_survey_items.csv", show_col_types = FALSE)

cat("==============================================\n")
cat("1. PARTICIPANT DEMOGRAPHICS (N = ", nrow(participants), ")\n")
cat("==============================================\n")

gender_tbl <- table(participants$Gender_Code)
cat("\n--- Gender Distribution ---\n")
print(gender_tbl)

cefr_tbl <- table(participants$CEFR_Code)
cat("\n--- CEFR Level Distribution ---\n")
print(cefr_tbl)

cat("\n--- AI Experience (Months) Summary ---\n")
print(summary(participants$AI_Experience_Months))

# 2. Authenticity Gap Scale (AGS) Reliability
cat("\n==============================================\n")
cat("2. AGS SCALE RELIABILITY & PSYCHOMETRICS\n")
cat("==============================================\n")

item_cols <- paste0("AGS_", sprintf("%02d", 1:15))
ags_matrix <- ags_items %>% select(all_of(item_cols))

alpha_res <- psych::alpha(ags_matrix)
cat("\n--- Overall Cronbach's Alpha (15 items) ---\n")
cat("Raw Alpha:", round(alpha_res$total$raw_alpha, 3), "\n")
cat("Standardized Alpha:", round(alpha_res$total$std.alpha, 3), "\n")

cat("\n--- AGS Total Mean ---\n")
cat("Mean:", round(mean(ags_items$AGS_Total_Mean, na.rm = TRUE), 2), "\n")
cat("SD:  ", round(sd(ags_items$AGS_Total_Mean, na.rm = TRUE), 2), "\n")

p <- ggplot(ags_items, aes(x = AGS_Total_Mean)) +
  geom_histogram(bins = 12, fill = "#2b8cbe", color = "white", alpha = 0.8) +
  geom_vline(xintercept = mean(ags_items$AGS_Total_Mean), color = "red", linetype = "dashed", linewidth = 1) +
  labs(
    title = "Distribution of Authenticity Gap Scale (AGS) Mean Scores",
    x = "AGS Mean Score (1-5 Likert)",
    y = "Participant Count"
  ) +
  theme_minimal(base_size = 12)

ggsave("plot_ags_distribution.png", plot = p, width = 7, height = 4.5, dpi = 300)
cat("\nSaved: plot_ags_distribution.png\n")
