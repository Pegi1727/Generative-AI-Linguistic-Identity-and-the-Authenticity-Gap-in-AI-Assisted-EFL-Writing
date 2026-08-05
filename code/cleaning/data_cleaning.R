fig4 <- ggplot(data, aes(
  x = proficiency_level,
  y = authenticity_gap_score,
  fill = feedback_type
)) +
  geom_boxplot() +
  labs(
    title = "Impact of Feedback Type across Proficiency Levels",
    x = "Proficiency Level (A2, B1, C1)",
    y = "Authenticity Gap Score"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

ggsave(
  filename = "Figures/fig4_statistical_results.png",
  plot = fig4,
  width = 8,
  height = 6,
  dpi = 300
)
