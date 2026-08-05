# Data Cleaning Script for ADFF Study
# Purpose: Prepare raw writing scores and questionnaire data for analysis

library(tidyverse)

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

raw_data <- read.csv("data/raw/writing_scores.csv")

ags_items <- c("ags_1", "ags_2", "ags_3", "ags_4", "ags_5")

missing_ags_columns <- setdiff(ags_items, names(raw_data))
if (length(missing_ags_columns) > 0) {
  stop(
    "These AGS item columns are missing: ",
    paste(missing_ags_columns, collapse = ", ")
  )
}

cleaned_data <- raw_data %>%
  select(-any_of("student_name")) %>%
  mutate(participant_id = sprintf("P%03d", row_number())) %>%
  mutate(
    ags_missing_proportion = rowMeans(is.na(pick(all_of(ags_items))))
  ) %>%
  filter(ags_missing_proportion <= 0.20) %>%
  select(-ags_missing_proportion)

if (anyNA(cleaned_data$authenticity_gap_score)) {
  warning(
    "Missing values remain in authenticity_gap_score; ",
    "they will be excluded only from the Shapiro-Wilk test."
  )
}

normality_data <- cleaned_data %>%
  filter(!is.na(authenticity_gap_score)) %>%
  pull(authenticity_gap_score)

if (length(normality_data) >= 3 && length(normality_data) <= 5000) {
  print(shapiro.test(normality_data))
} else {
  warning("Shapiro-Wilk requires between 3 and 5,000 non-missing observations.")
}

write.csv(
  cleaned_data,
  "data/processed/final_analysis_data.csv",
  row.names = FALSE
)

message("Data cleaning completed successfully.")
