# Download the raw data

file_path <- "src/watch_rates_analysis/data/watch_events.csv"
data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"


# Ensure the watch_rates_analysis data directory exists
dir.create(dirname(file_path), recursive = TRUE, showWarnings = FALSE)


# Download if the file does not exist yet
if (!file.exists(file_path)) {
  download.file(data_url, destfile = file_path, mode = "wb")
  message("Dataset downloaded successfully.")
} else {
  message("File already exists. Skipping download.")
}