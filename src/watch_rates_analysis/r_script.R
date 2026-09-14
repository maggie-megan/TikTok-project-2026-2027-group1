# Get the necessary packages and basic programming
library(tidyverse)
library(dplyr)
library(ggplot2)
watch_events <- read.csv("src/watch_rates_analysis/data/watch_events.csv")

# Remove impression_id, as it's the same as watch_event_id
clean_watch_events <- watch_events %>% select(-impression_id)

# remove NA from watch_seconds
clean_watch_events <- clean_watch_events %>% drop_na(watch_seconds)

#show summary of clean_watch_events to confirm correct coding
summary(clean_watch_events)

#We are ready to analyze!

# First plot: a histogram of all the amount of different actions
action_plot <- ggplot(clean_watch_events, aes(x = factor(
  action,
  levels = c("exit_platform", "skip_immediate", "skip_after_partial", "watch_full")
))) +
  geom_bar(fill = "skyblue") +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.3
  ) +
  labs(
    title = "Number of Watch Events by Action",
    x = "Action",
    y = "Number of events"
  )
print(action_plot)

#This shows the amount of times someone exited TikTok, skipped a video immediately 
# or after watching it partially, or watched the entire video

# Create a new folder and save the bar chart
dir.create("src/watch_rates_analysis/output", recursive = TRUE, showWarnings = FALSE)

ggsave(
  filename = "src/watch_rates_analysis/output/action_plot.png",
  plot = action_plot,
  width = 8,
  height = 5,
  dpi = 300
)

# Let's make a chart showing the distribution of watch seconds
watch_seconds_plot <- ggplot(clean_watch_events, aes(x = watch_seconds)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "white") +
  labs(
    title = "Distribution of Watch Time",
    x = "Watch seconds",
    y = "Number of watch events"
  )
print(watch_seconds_plot)

# We can see that most people skip almost immediately 
# and the watch seconds seem to diminish gradually.

# Let's save this plot as well
ggsave("src/watch_rates_analysis/output/watch_seconds_plot.png",
plot = watch_seconds_plot,
width = 8,
height = 5,
dpi = 300)

# Let's use a boxplot to plot watch seconds against actions
# We remove the action of skipping immediately, as there will be no watch seconds to count
watch_seconds_per_action <- clean_watch_events %>%
  filter(action != "skip_immediate") %>%
  ggplot(aes(
    x = factor(action, levels = c("exit_platform", "skip_after_partial", "watch_full")),
    y = watch_seconds
  )) +
  geom_boxplot(fill = "skyblue") +
  labs(
    title = "Watch Time per Viewer Action",
    x = "Actions",
    y = "Watch Seconds"
  )
print(watch_seconds_per_action)

# We can now see the watch seconds per action taken (minus skipping immediately)
# Let's save this chart as well
ggsave(filename = "src/watch_rates_analysis/output/watch_seconds_per_action_plot.png",
plot = watch_seconds_per_action,
width = 8,
height = 5,
dpi = 300)

# Let's show the top creators in terms of average watch seconds
creator_average_watch <- clean_watch_events %>% 
  group_by(creator_id) %>% 
  summarise(average_watch_seconds = mean(watch_seconds),
    number_of_events = n()) %>%
  arrange(desc(average_watch_seconds))

# Keep only top 25 creators
top_25_creators <- creator_average_watch %>% slice_head(n = 25)

# Plot top 25 creators ordered by average watch seconds
best_creator_plot <- ggplot(top_25_creators, aes(
  x = average_watch_seconds,
  y = reorder(as.factor(creator_id), average_watch_seconds))) + 
  geom_col(fill = "skyblue") +
  labs(title = "Top 25 Creators by Average Watch Seconds",
    x = "Average Watch Seconds",
    y = "Creator ID")
print(best_creator_plot)

# Congrats to creator number 39!

#Let's save this chart as well
ggsave("src/watch_rates_analysis/output/best_creator_plot.png",
plot = best_creator_plot,
width = 10,
height = 6,
dpi = 300)

