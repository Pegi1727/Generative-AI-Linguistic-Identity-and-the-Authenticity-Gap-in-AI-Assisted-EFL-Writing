# ==============================================================================
# Script 02: Linguistic Features Comparison & Paired T-Tests
# Study: Authenticity Gap in AI-Assisted Academic Writing
# Lead Researcher: Dr. Pegah Merrikhi
# ==============================================================================

required_pkgs <- c("tidyverse", "effsize", "readr", "ggplot2")
new_pkgs <- required_pkgs[!(required_pkgs %in% installed.packages()[, "Package"])]
if(length(new_pkgs)) install.packages(new_pkgs, dependencies = TRUE)

suppressPackageStartupMessages({
  library(tidyverse)
  library(effsize)
  library(readr)
  library(ggplot2)
})

ling_df <- read_csv("linguistic_features_120.csv", show_col_types = FALSE)

raw_df <- ling_df %>% filter(Condition_Code == 0) %>% arrange(Participant_ID)
ai_df  <- ling_df %>% filter(Condition_Code == 1) %>% arrange(Participant_ID)

features <- c(
  "Grammar_Errors",
  "Error_Free_T_Units_Pct",
  "MTLD_Lexical_Diversity",
  "Lexical_Overlap_Pct",
  "Stance_Markers_Per_100w",
  "First_Person_Expressions_Per_100w"
)

results_list <- list()

cat("==============================================\n")
cat("PAIRED T-TESTS (RAW vs AI-ASSISTED, N = 60)\n")
cat("==============================================\n\n")

for (f in features) {
  raw_v <- raw_df[[f]]
  ai_v  <- ai_df[[f]]

  t_res <- t.test(ai_v, raw_v, paired = TRUE)
  d_res <- cohen.d(ai_v, raw_v, paired = TRUE)

  results_list[[f]] <- data.frame(
    Feature = f,
    Raw_Mean = round(mean(raw_v), 2),
    Raw_SD = round(sd(raw_v), 2),
    AI_Mean = round(mean(ai_v), 2),
    AI_SD = round(sd(ai_v), 2),
    t_stat = round(t_res$statistic, 2),
    df = t_res$parameter,
    p_value = format.pval(t_res$p.value, digits = 3, eps = 0.001),
    Cohens_d = round(d_res$estimate, 2)
  )
}

ttest_summary <- bind_rows(results_list)
print(ttest_summary)

write_csv(ttest_summary, "r_paired_ttest_results.csv")
cat("\nResults saved to: r_paired_ttest_results.csv\n")

ling_long <- ling_df %>%
  select(Participant_ID, Condition, all_of(features)) %>%
  pivot_longer(cols = all_of(features), names_to = "Feature", values_to = "Value")

p_box <- ggplot(ling_long, aes(x = Condition, y = Value, fill = Condition)) +
  geom_boxplot(alpha = 0.7, outlier.shape = 21) +
  facet_wrap(~Feature, scales = "free_y", ncol = 3) +
  scale_fill_manual(values = c("Raw" = "#e7298a", "AI" = "#1b9e77")) +
  theme_bw(base_size = 11) +
  theme(legend.position = "none", strip.background = element_rect(fill = "#f0f0f0")) +
  labs(
    title = "Linguistic Metric Differences: Raw vs. AI-Assisted Writing",
    x = "Writing Condition",
    y = "Score / Count"
  )

ggsave("plot_linguistic_boxplots.png", plot = p_box, width = 11, height = 6, dpi = 300)
cat("Saved: plot_linguistic_boxplots.png\n")
