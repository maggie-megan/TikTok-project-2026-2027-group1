# Load required libraries
library(tidyverse)

# 1. Read dataset
df <- read_csv("../../data/users.csv")

# 2. Basic cleaning
df_clean <- df %>%
  drop_na() %>%                      
  distinct()  

# 3. Starter Model: Bivariate Regression

model_basic <- lm(satiation_decay ~ pref_Comedy, data = df_clean)

cat("--- BASELINE MODEL SUMMARY ---\n")
summary(model_basic)

# interpretation of basic model: there is no meaningful or statistically significant linear relationship between a user's Comedy preference and their rate of satiation decay
# coefficient estimate: -1.813e-07 (changes in Comedy preference do not drive changes in satiation decay)
# p-value: 0.999 (value above 0.05 means the result is not statistically significant)

# 4. Extended Model(Genre Preferences + Overall Activity)
# Testing different genres tests whether satiation decay is specific to content type rather than just Comedy.
# Behavioral Control (base_videos_watched_mean): Heavy platform users might have naturally different fatigue/decay rates compared to casual users regardless of what they watch.

model_expanded <- lm(
  satiation_decay ~ pref_Comedy + pref_Gaming + pref_BeautyFashion + pref_Travel + base_videos_watched_mean, 
  data = df_clean
)

summary(model_expanded)

# interpretation of expanded model: zero significance across the board
# Adjusted R-squared: -3.306e-05 (these variables collectively explain none of the variance in satiation_decay)
# p-values: every single value is way above 0.05 (ranging from 0.356 to 0.994 - no significant results)

# Conclusion: User satiation decay appears to operate independently of specific genre preferences or overall volume of baseline videos watched in this dataset.


# 5. Output Visualization

# Create target folder if it does not exist
if (!dir.exists("Regression_analysis")) {
  dir.create("Regression_analysis", recursive = TRUE)
}

# Generate scatter plot with baseline regression line

p_regression <- ggplot(df_clean, aes(x = pref_Comedy, y = satiation_decay)) +
  geom_point(alpha = 0.2, color = "#8A9A86") +                     # Sage green points
  geom_smooth(method = "lm", color = "#3B4A3A", fill = "#B0C4DE", se = TRUE) + # Darker sage regression line
  labs(
    title = "Satiation Decay vs. Comedy Preference",
    subtitle = "Linear regression line shows no significant correlation",
    x = "Preference Score for Comedy",
    y = "Satiation Decay Rate"
  ) +
  theme_minimal()

# Save plot file
ggsave("Regression_analysis/satiation_decay_regression.png", plot = p_regression, width = 7, height = 5)


library(tidyr)

# Reshape data for multi-panel plotting
df_long <- df_clean %>%
  select(satiation_decay, pref_Comedy, pref_Gaming, pref_BeautyFashion, pref_Travel) %>%
  pivot_longer(
    cols = starts_with("pref_"),
    names_to = "Category",
    values_to = "Preference_Score"
  ) %>%
  mutate(Category = str_remove(Category, "pref_"))

# Generate panel plot

p_expanded <- ggplot(df_long, aes(x = Preference_Score, y = satiation_decay)) +
  geom_point(alpha = 0.15, color = "#C8B6E2") +                      # Soft lilac points
  geom_smooth(method = "lm", color = "#6A5ACD", fill = "#E6E6FA", se = TRUE) + # Slate/purple regression line & soft fill
  facet_wrap(~ Category, scales = "free_x") +
  labs(
    title = "Satiation Decay vs. Content Genre Preferences",
    subtitle = "Expanded Model Comparison across Categories",
    x = "Preference Score",
    y = "Satiation Decay Rate"
  ) +
  theme_minimal()

ggsave("Regression_analysis/satiation_decay_expanded_plot.png", plot = p_expanded, width = 8, height = 6)


# End of the regression analysis
