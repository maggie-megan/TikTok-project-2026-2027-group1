## Analysis of Impressions Data 

## Part 1: Loading in packages and file

# Insatll and Load packages
install.packages("tidyverse")
library(tidyverse)

# Load in Raw Data file
raw_impressions <- read_csv("data/raw/impressions.csv")

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
