# Create the data folder if it does not already exist
if (!dir.exists("data/raw")) {
  dir.create("data/raw")
}

# Store the URL of the dataset
url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/sessions.csv"

# Download the dataset into the data folder
download.file(url, destfile = "data/raw/sessions.csv")


