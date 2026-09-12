# Do basic cleaning of the data  

library(readr)

sessions <- read_csv("data/sessions.csv")

head(sessions)

# Check Missing values
colSums(is.na(sessions))

# Check Duplicate rows
sum(duplicated(sessions))

# Check Session Duration
sum(sessions$session_duration_sec < 0, na.rm = TRUE)


library(tidyverse)
library(lubridate)

# session_duration_histogram

p1<- ggplot(data= sessions, aes(x=session_duration_sec)) +
geom_histogram(
  bins = 20 ,
    fill = "blue",
     color = "white") +
  labs(
    title = "distribution of session duration",
    x = "sesseion duration " ,
    y = "count"
  )




# videos_viewed _vs_session_duration  

p2<- ggplot(data= sessions, aes(x=videos_viewed , y=session_duration_sec)) +
geom_point(
     color = "blue",
     alpha = 0.3
    ) +
  labs(
    title = "video vs session",
    x = "videos_viewed" ,
    y = "session_duration"
  )


# sessions_by_login_hour

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
    title = "Number of Sessions by Login Hour",
    x = "Login Hour",
    y = "Number of Sessions"
  ) +
  scale_x_continuous(
    breaks = 0:23
  )

# save photos

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


