library(tidyverse)

if (!dir.exists("data/raw")) {
  dir.create("data/raw")
}

url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/users.csv"
download.file(url, destfile = "data/raw/users.csv")
