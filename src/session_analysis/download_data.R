# Create the data folder if it does not already exist
dir.create("data", showWarnings = FALSE)

# Store the URL of the dataset
url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/sessions.csv"

# Download the dataset into the data folder
download.file(url, destfile = "data/sessions.csv")


