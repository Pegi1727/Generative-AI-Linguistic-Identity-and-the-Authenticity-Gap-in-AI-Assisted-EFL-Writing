
```R
# Visualization Script for Research Figures
# Purpose: Generate publication-quality plots for the manuscript

library(ggplot2)

# Load data
data <- read.csv("data/processed/final_analysis_data.csv")

# Figure 4: Interaction Plot (Proficiency Level vs Authenticity Gap)
ggplot(data, aes(x = proficiency_level, y = authenticity_gap_score, fill = feedback_type)) +
  geom_boxplot() +
  labs(title = "Impact of Feedback Type across Proficiency Levels",
       x = "Proficiency Level (A2, B1, C1)",

       y = "Authenticity Gap Score") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

# Save the plot as PNG for the manuscript
ggsave("Figures/fig4_statistical_results.png", width = 8, height = 6, dpi = 300)

print("Figures generated and saved successfully.")
```

---
