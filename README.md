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
The aim of this project is to clean, analyse and visualise data from TikTok users. The project consists of four main analyses focusing on TikTok impressions, watch rates, users and sessions, followed by a regression analysis of user satiation. The project uses CSV data but also displays how an SQLite database could be used as data sources. Additionally, the project aimed to develop skills in collaborative data analytics, GitHub and reproducible research.

## Environment & dependencies 
### Folder structure
The relevant files and folder are organised as follows:
TikTok-project-2026-2027-group1/
├── data/
│   └── output/
│   └── raw/
├── documents/
├── fig_outputs/
├── src/
│   └── analysis_impressions/
│   └── regression_analysis/
│   └── session_analysis/
│   └── tiktok_analysis/
│   └── video_view_analysis/
│   └── watch_rates_analysis/
│   └── download_database.R
├── .gitignore
├── README.md 
├── makefile

### Dependencies
To reproduce this analysis, you will need:

- **R** (version 4.6.1 recommended)
- **R packages:**
  - `tidyverse`
  - `ggplot2`
  - `lubridate`
  - `dplyr`
  - `here`
  - `DBI`
  - `RSQLite`
  - `rmarkdown`
  - `knitr`
- **GNU Make** to run the automated analysis pipeline.
- A LaTeX installation (e.g. TinyTeX) to generate the final PDF report.

## Reproduction of the analysis 
To reproduce the complete analysis, navigate to the project root in the terminal and run *make*. The Makefile automatically downloads the required raw datasets and SQLite database, runs the analysis scripts, generates the cleaned datasets and figures, and renders the final report. The resulting PDF is saved as documents/report.pdf.

**Optional**: You can run all the individual Rscripts within src/. This will allow you to look at individual codes and produce figures for certain analysis. 

## Troubleshooting
- If you get errors about missing folders or data, confirm you are in the correct working directory and that your project structure matches the diagram above.
- If package errors occur, install them as described in the dependencies section.
- If folder or file errors persist, check for correct spelling and capitalization.
