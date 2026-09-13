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


# 4. Create visualization with dark green theme - baseline logins
p <- ggplot(df_clean, aes(x = baseline_login)) +
  geom_histogram(
    bins = 25, 
    fill = "#E88D8D",       # Changed to dark green
    color = "#FFFFFF",          # Soft white bar borders
    alpha = 0.4              
  ) +
  labs(
    title = "Distribution of Baseline Logins",
    subtitle = "User engagement frequency across TikTok research participants",
    x = "Baseline Login Score",
    y = "User Count"
  ) +
  theme_classic(base_size = 11) +
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "#2C3E50"),
    plot.subtitle = element_text(color = "#7F8C8D", size = 10, margin = margin(b = 10)),
    axis.title = element_text(face = "bold", color = "#34495E"),
    axis.line = element_line(color = "#BDC3C7"),
    axis.ticks = element_line(color = "#BDC3C7")
  )

# 5. Save output plot
ggsave("src/tiktok_analysis/gen/output/logins_distribution.png", plot = p, width = 7, height = 4.5, dpi = 300)

# Create plot 2: Content preferences comparison (explore user preferences)

library(tidyverse)

pref_summary <- df_clean %>%
  summarise(
    Comedy = mean(pref_Comedy, na.rm = TRUE),
    Gaming = mean(pref_Gaming, na.rm = TRUE),
    Pets = mean(pref_Pets, na.rm = TRUE),
    Food = mean(pref_Food, na.rm = TRUE),
    Beauty = mean(pref_BeautyFashion, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = everything(), names_to = "Category", values_to = "Avg_Preference")

p_pref <- ggplot(pref_summary, aes(x = reorder(Category, Avg_Preference), y = Avg_Preference)) +
  geom_col(fill = "#E88D8D", width = 0.6) +
  coord_flip() +
  labs(
    title = "Average User Interest by Content Category",
    subtitle = "Mean preference scores across primary TikTok video genres",
    x = "Content Category",
    y = "Average Preference Score"
  ) +
  theme_classic(base_size = 11) +
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "#2C3E50"),
    plot.subtitle = element_text(color = "#7F8C8D", size = 10, margin = margin(b = 10)),
    axis.title = element_text(face = "bold", color = "#34495E")
  )

ggsave("src/tiktok_analysis/gen/output/content_preferences.png", plot = p_pref, width = 7, height = 4.5, dpi = 300)

# Experiment with plot 2
p_pref <- ggplot(pref_summary, aes(x = reorder(Category, Avg_Preference), y = Avg_Preference)) +
  geom_col(fill = "#87A96B", width = 0.6) +
  coord_flip() +
  labs(
    title = "Average User Interest by Content Category",
    subtitle = "Mean preference scores across primary TikTok video genres",
    x = "Content Category",
    y = "Average Preference Score"
  ) +
  theme_classic(base_size = 11) +
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "#2C3E50"),
    plot.subtitle = element_text(color = "#7F8C8D", size = 10, margin = margin(b = 10)),
    axis.title = element_text(face = "bold", color = "#34495E")
  )

ggsave("src/tiktok_analysis/gen/output/content_preferences.png", plot = p_pref, width = 7, height = 4.5, dpi = 300)

# Create plot 3: Scatter plot - Baseline Logins and Videos Watched (are the people who log in also watching more videos?)

p_scatter <- ggplot(df_clean, aes(x = baseline_login, y = base_videos_watched_mean)) +
  geom_point(alpha = 0.4, color = "#89CFF0", size = 2) +
  geom_smooth(method = "lm", se = TRUE, color = "#4682B4", fill = "#B0E0E6") +
  labs(
    title = "User Logins vs. Average Videos Watched",
    subtitle = "Exploring the relationship between baseline login frequency and video consumption",
    x = "Baseline Login Score",
    y = "Mean Videos Watched"
  ) +
  theme_classic(base_size = 11) +
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "#2C3E50"),
    plot.subtitle = element_text(color = "#7F8C8D", size = 10, margin = margin(b = 10)),
    axis.title = element_text(face = "bold", color = "#34495E")
  )

ggsave("src/tiktok_analysis/gen/output/logins_vs_videos.png", plot = p_scatter, width = 7, height = 4.5, dpi = 300)