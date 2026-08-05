# Statistical Analysis Script for the Authenticity Gap Study
# Purpose: Test hypotheses on Linguistic Identity and AI Voice

library(tidyverse)
library(psych)
library(car)       # Levene's test
library(effectsize) # Effect sizes

# -------------------------------------------------------------------
# Setup and data import
# -------------------------------------------------------------------
data <- read.csv("data/processed/final_analysis_data.csv")

# Ensure categorical variables are treated as factors
data <- data %>%
  mutate(
    proficiency_level = factor(proficiency_level),
    feedback_type = factor(feedback_type)
  )

# Confirm that all required variables exist
required_vars <- c(
  "raw_voice_lex_div",
  "ai_voice_lex_div",
  "authenticity_gap_score",
  "proficiency_level",
  "feedback_type",
  "identity_compression_score"
)

missing_vars <- setdiff(required_vars, names(data))

if (length(missing_vars) > 0) {
  stop(
    "The following required variables are missing from the dataset: ",
    paste(missing_vars, collapse = ", ")
  )
}

# -------------------------------------------------------------------
# Hypothesis 1: Difference between Raw Voice and AI Voice
# -------------------------------------------------------------------
# Keep complete paired observations only
paired_data <- data %>%
  select(raw_voice_lex_div, ai_voice_lex_div) %>%
  drop_na()

# Check normality of paired difference scores
difference_scores <- paired_data$raw_voice_lex_div -
  paired_data$ai_voice_lex_div

print(shapiro.test(difference_scores))

# Paired-samples t-test
t_test_result <- t.test(
  paired_data$raw_voice_lex_div,
  paired_data$ai_voice_lex_div,
  paired = TRUE,
  alternative = "two.sided"
)

print(t_test_result)

# Paired-samples effect size: Cohen's dz
paired_effect_size <- cohens_d(
  paired_data$raw_voice_lex_div,
  paired_data$ai_voice_lex_div,
  paired = TRUE
)

print(paired_effect_size)

# -------------------------------------------------------------------
# Hypothesis 2: Interaction between Proficiency Level and Feedback Type
# -------------------------------------------------------------------
anova_data <- data %>%
  select(
    authenticity_gap_score,
    proficiency_level,
    feedback_type
  ) %>%
  drop_na()

# Two-way factorial ANOVA:
# * includes both main effects and their interaction
anova_result <- aov(
  authenticity_gap_score ~ proficiency_level * feedback_type,
  data = anova_data
)

summary(anova_result)

# Assumption checks
# 1. Normality of ANOVA residuals
print(shapiro.test(residuals(anova_result)))

# 2. Homogeneity of variance across cells
print(
  leveneTest(
    authenticity_gap_score ~ proficiency_level * feedback_type,
    data = anova_data
  )
)

# Effect sizes: partial eta-squared
anova_effect_sizes <- eta_squared(anova_result, partial = TRUE)
print(anova_effect_sizes)

# Tukey-adjusted comparisons of all factor-level combinations
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# -------------------------------------------------------------------
# Correlation: Identity Compression vs. Authenticity Gap
# -------------------------------------------------------------------
correlation_data <- data %>%
  select(
    identity_compression_score,
    authenticity_gap_score
  ) %>%
  drop_na()

# Pearson correlation; replace method = "spearman" if assumptions
# of linearity / approximate normality are not tenable.
cor_test <- cor.test(
  correlation_data$identity_compression_score,
  correlation_data$authenticity_gap_score,
  method = "pearson"
)

print(cor_test)

# Descriptive statistics for transparent reporting
descriptives <- data %>%
  select(
    raw_voice_lex_div,
    ai_voice_lex_div,
    authenticity_gap_score,
    identity_compression_score
  ) %>%
  psych::describe()

print(descriptives)

message("All statistical analyses completed successfully.")
