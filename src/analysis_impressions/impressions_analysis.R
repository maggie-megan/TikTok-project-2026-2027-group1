## Analysis of Impressions Data 

## Part 1: Loading in packages and file

# Load packages
library(tidyverse)
library(here)

# Load in Raw Data file
raw_impressions <- read_csv(here("data", "raw", "impressions.csv"))

# Initial look at the data
view(raw_impressions)

dim(raw_impressions) #Number of rows and coloums
names(raw_impressions) #Names of variables
head(raw_impressions) #Look at a few variables

## Part 2: Cleaning the data

# Creating a copy of the data to clean
clean_impressions <- raw_impressions

# Check for any missing values
colSums(is.na(clean_impressions))

# Check for and remove any duplicate rows
sum(duplicated(clean_impressions))
clean_impressions <- clean_impressions[!duplicated(clean_impressions), ]

# Convert categorical variables to factors
clean_impressions$source_bucket <- as.factor(clean_impressions$source_bucket)
clean_impressions$mission_ids <- as.factor(clean_impressions$mission_ids)

# Check structure
str(clean_impressions)

## Part 3: Analysing and Plotting the data

# Plot 1: How does impression volume change throughout a day?
## Summarise the impressions by hour
hour_impressions <- tibble(hour = 0:23) %>%
  left_join(
    clean_impressions %>%
    mutate(hour = lubridate::hour(shown_at)) %>%
    group_by(hour) %>%
    summarise(impression_count = n(), .groups = 'drop'),
  by = "hour") %>%
  mutate(impression_count = ifelse(is.na(impression_count), 0, impression_count))

## Plot the impressions volume throughout the day 
plot_1 <- ggplot(hour_impressions, aes(x = hour, y = impression_count)) +
  geom_line(colour = "skyblue", linewidth = 1) + 
  geom_point(colour = "steelblue", size = 2) +
  labs(
    title = "Impression Volume Throughout a Day",
    x = "Hour of the Day",
    y = "Number of Impressions"
  ) + 
  theme_minimal() + 
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 13)
  ) + 
  expand_limits(y = 0)
plot_1 #view plot

## Save the plot as .png
ggsave(
  filename = here("fig_outputs", "impression_volume_hourly.png"),
  plot = plot_1,
  width = 8, height = 5, units = "in", dpi = 300
)

# Plot 2: Do some Recommendation methods Yield Higher Total Scores?
## Order source_bucket factor by median score_total
box_data <- clean_impressions %>%
  group_by(source_bucket) %>%
  mutate(median_score = median(score_total)) %>%
  ungroup() %>%
  arrange(median_score) %>%
  mutate(source_bucket = factor(source_bucket, unique(source_bucket))) %>%
  select(-median_score)

## Plot source_bucket against score_total
plot_2 <- ggplot(box_data, aes(x = source_bucket, y = score_total)) +
  geom_boxplot(fill = "lightgreen", colour = "darkgreen") +
  labs(
    title = "Distribution of Total Score by Recommendation Method",
    x = "Recommendation Method",
    y = "Total Score"
  ) + 
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 13))
plot_2 #view plot

## Save the plot as .png
ggsave(
  filename = here("fig_outputs", "impression_volume_hourly.png"),
  plot = plot_2,
  width = 8, height = 5, units = "in", dpi = 300
)

# Plot 3: Does feed position affect user satiation with similar content?
## Calculate mean penalty for feed rank
mean_penalty_rank <- clean_impressions %>%
  group_by(feed_rank) %>%
  summarise(mean_penalty = mean(score_satiation_penalty, na.rm = TRUE)) %>%
  ungroup()

## Plotting feed rank against mean satiation penalty
plot_3 <- ggplot(mean_penalty_rank, aes(x = feed_rank,  y = mean_penalty)) +
  geom_point(colour = "orange", size = 2) +
  geom_smooth(method = "gam", colour = "gold", se = FALSE, size = 1) +
  labs(
    title = "Feed Position Impact on User Satiation",
    x = "Feed Position (Rank)",
    y = "Mean Satiation Penalty"
  ) + 
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 13)) 
plot_3 #view plot

## Save the plot as .png
ggsave(
  filename = here("fig_outputs", "impression_volume_hourly.png"),
  plot = plot_3,
  width = 8, height = 5, units = "in", dpi = 300
)

# Plot 4: Which creators generate the highest scored content?
## Select top creators based on total score
top_creators <- clean_impressions %>%
  group_by(creator_id) %>%
  summarise(avg_score_total = mean(score_total, na.rm = TRUE), count = n()) %>%
  filter(count >= 100) %>%
  arrange(desc(avg_score_total)) %>%
  slice_head(n = 10)

## Plot to view top 10 creators
plot_4 <- ggplot(top_creators, aes(x = reorder(creator_id, avg_score_total), y = avg_score_total)) + 
  geom_bar(stat = "identity", fill = "plum") + 
  coord_flip() + 
  labs(
    title = "Top Creators By Average Total Score",
    x = "Creator",
    y = "Average Total Score"
  ) + 
  theme_minimal() + 
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 13)) 
plot_4 #view plot

## Save the plot as .png
ggsave(
  filename = here("fig_outputs", "impression_volume_hourly.png"),
  plot = plot_4,
  width = 8, height = 5, units = "in", dpi = 300
)

##### End of script