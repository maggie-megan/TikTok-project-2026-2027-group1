# Load required libraries
library(tidyverse)

# 1. Read dataset
df <- read_csv("src/tiktok_analysis/data/users.csv")

# 2. Basic cleaning
df_clean <- df %>%
  drop_na() %>%                      
  distinct()                          

# 3. Create output directory
if (!dir.exists("src/tiktok_analysis/gen/output")) {
  dir.create("src/tiktok_analysis/gen/output", recursive = TRUE)
}

# 4. Create visualization with dark green theme
p <- ggplot(df_clean, aes(x = baseline_login)) +
  geom_histogram(
    bins = 30, 
    fill = "#E86F88",       # Changed to dark green
    color = "white",          # Crisp white bar borders
    alpha = 0.85              # Soft visual finish
  ) +
  labs(
    title = "Distribution of Baseline Logins",
    subtitle = "Analysis of user activity frequency from TikTok research data",
    x = "Baseline Login Score",
    y = "Number of Users"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "dimgrey"),
    axis.title = element_text(face = "bold")
  )

# 5. Save output plot
ggsave("src/tiktok_analysis/gen/output/logins_distribution.png", plot = p, width = 7, height = 5)

