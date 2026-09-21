# Loading all the packages
library(readr)
library(tidyverse)
library(lubridate)

# Basic cleaning of the data  
sessions <- read_csv("data/sessions.csv")

head(sessions)

# Check Missing values
colSums(is.na(sessions))

# Check Duplicate rows
sum(duplicated(sessions))

# Check Session Duration
sum(sessions$session_duration_sec < 0, na.rm = TRUE)

# Since there are no missing values, duplicated rows or negative session durations, we will proceed with the figures.



# Plot 1: Distribution of session duration

# A histogram showing how long user sessions last.

p1<- ggplot(data= sessions, aes(x=session_duration_sec)) +
geom_histogram(
  bins = 20 ,
    fill = "blue",
     color = "white") +
  labs(
    title = "Distribution of session duration",
    x = "session duration in seconds" ,
    y = "Number of sessions"
  )
print(p1)


# Plot 2: Videos viewed vs session duration

# A scatterplot showing the relationship between videos viewed and the duration of the session

p2<- ggplot(data= sessions, aes(x=videos_viewed , y=session_duration_sec)) +
geom_point(
     color = "blue",
     alpha = 0.3
    ) +
  labs(
    title = "Relationship between videos viewed and session duration",
    x = "Number of videos viewed" ,
    y = "Session duration, in seconds"
  )
print(p2)

# Plot 3: Number of sessions by login hour
# A bar chart showing at what hour users log in

# We make an extra column, showing the hour users log in
sessions <- sessions %>%
  mutate(login_hour = hour(login_at))

names(sessions)

p3<- ggplot(data = sessions, aes(x = login_hour)) +
  geom_bar(
    fill = "steelblue",
    color = "white",
    alpha = 0.8
  ) +
  labs(
    title = "Number of sessions by login hour",
    x = "Login hour, using a 24 hour clock",
    y = "Number of sessions"
  ) +
  scale_x_continuous(
    breaks = 0:23
  )
print(p3)

# Saving the plots

ggsave(
  "fig_outputs/session_duration.png",
  plot = p1,
  width = 8,
  height = 6
)

ggsave(
  "fig_outputs/videos_viewed_vs_session_duration.png",
  plot = p2,
  width = 8,
  height = 6
)

ggsave(
  "fig_outputs/sessions_by_login_hour.png",
  plot = p3,
  width = 8,
  height = 6
)


