# Tiktok project 2026 Group 1

## Group members and contributions
- Maggie Megan
    - Created the AI folder 
    - Created the summary of the CSV file using Quarto.
    - Created analysis_impressions and edited watch_rates_analysis
- Maja Gresik
    - Wrote the code for the data
    - Created tiktok_analysis and edited analysis_impressions
- Merel van Buren
    - Created and kept updating the README
    - Created watch_rates_analysis and edited session_analysis
- Mohammadjavad Ghandibaghbanzadeh
    - Created the .gitignore
    - Created session_analysis and edited tiktok_analysis
 
## The goal of the project
Clean and analyze data, learn how to collaborate in data analytics and github.

## Environment & dependencies 
### Folder structure
In the Data folder, we have two subfolders, one for the raw data and one for the output. 
In the Documents folder, you can find our AI usage, our Quatro report and our R history. 
Then, in the fig_outputs folder, you can find our figures from our data, in scripts you can find our R scripts and in src, you can find our seperate project folders.

### Dependencies
To reproduce this analysis, you will need: 
- **R** (version 4.6.1 recommended) to run the R scripts
- **R packages:**  
  - `tidyverse`
    - Within tidyverse packages: `ggplot2`, `lubridate`, `dplyr`
  - `here`
- **GNU Make:** to run the Makefile (optional; you can also run the R script directly)
- **Data:** `data/raw/impressions.csv`(this will can be downloaded by running the script "raw_data_impressions.R")

## Reproduction of the analysis 
Please run the code in the following order:
- download data file script in data/raw
- run Quarto file "tiktok_project_report"
- To run the full analysis, navigate to the root repository and run *make* in the terminal.
    - If you would like to check seperate analyses navigate to those folders and either run the R codes seperatley or run *make* in the terminal

## Troubleshooting
- If you get errors about missing folders or data, confirm you are in the correct working directory and that your project structure matches the diagram above.
- If package errors occur, install them as described in the dependencies section.
- If folder or file errors persist, check for correct spelling and capitalization.
