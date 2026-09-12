# TikTok Impressions Analysis

## Author
Maggie Megan
 
## Description
The impression analysis aims to look at different impression factors when looking at data from TikTok. This analysis looks at variables such as shown_at, feed_rank, source_bucket, score_satiation_penalty, and score_total.

## Project Structure
The relevant files and folder are organised as follows:
TikTok-project-2026-2027-group1/
├── data/
│   └── output/
│   └── raw/
├── documents/ (not relevant to this analysis)
├── fig_outputs/
├── scripts/ (not relevant to this analysis)
├── src/
│   └── analysis_impressions/
│       ├── impressions_analysis.R
│       ├── raw_data_impressions.R
│       └── Makefile
├── .gitignore
├── README.md 

## Dependencies
To reproduce this analysis, you will need: 
- **R** (version 4.6.1 recommended) to run the R scripts
- **R packages:**  
  - `tidyverse`
    - Within tidyverse packages: `ggplot2`, `lubridate`, `dplyr`
  - `here`
- **GNU Make:** to run the Makefile (optional; you can also run the R script directly)
- **Data:** `data/raw/impressions.csv`(this will can be downloaded by running the script "raw_data_impressions.R")
- **Folder structure:**  
  - The following subfolders must exist:
    - `src/analysis_impressions` (for scripts and makefile)
    - `data/raw/` (for the CSV file)
    - `fig_outputs/` (for output images; this is created by the script if missing)

### Installing R packages
Open R and run: 
install.packages(c("tidyverse", "here"))

## Reproduction of the analysis 
Before running the code make sure that you are in the correct working directory (TikTok-project-2026-2027-group1/src/analysis_impressions), if you are not in this directory navigate your way to it.

The code should be run in the following order:
1. **raw_data_impressions.R** - This file will download the file "impressions.csv" into data/raw. (If the file does not download check whether the file has already been downloaded and if you are in the right working directory.)
2. **Makefile** - In the terminal run: make. This will run the file of "impressions_analysis.R". When this file is run successfully the files "impressions_volume_hourly.png", "recommendation_method_total_score.png", "top_creator_total_score.png", and "user_saitiation.png" will be created in fig_outputs/. (If errors occur check that you are in the right working directory)
3. **Optional:** impressions_analysis.R - If you want to make changes to the data or plots produced, edits can be made within this file. However, if changes are made make sure that the makefile is also updated. 

## Cleaning Outputs 
To remove all generated figures, in the terminal run:
make clean

## Troubleshooting
- If you get errors about missing folders or data, confirm you are in the correct working directory and that your project structure matches the diagram above.
- If package errors occur, install them as described in the dependencies section.
- If folder or file errors persist, check for correct spelling and capitalization.