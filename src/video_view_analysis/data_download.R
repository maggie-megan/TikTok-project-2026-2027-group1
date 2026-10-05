# Define file 
file_path <- "data/raw/video_view.csv"
data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/video_view.csv"

#Ensure the raw data directory exists
if (!dir.exists("data/raw")) {
  dir.create("data/raw", recursive = TRUE)
}

# Download if the file does not exist yet
if (!file.exists(file_path)) {
  download.file(data_url, destfile = file_path, mode = "wb")
  message("Dataset downloaded successfully.")
} else {
  message("File already exists. Skipping download.")
}
