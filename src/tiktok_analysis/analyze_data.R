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

# 4. Create visualization
p <- ggplot(df_clean, aes(x = baseline_login)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "Distribution of Baseline Logins",
    x = "Baseline Login Trait",
    y = "User Count"
  ) +
  theme_minimal()

# 5. Save output plot
ggsave("src/tiktok_analysis/gen/output/logins_distribution.png", plot = p, width = 7, height = 5)

