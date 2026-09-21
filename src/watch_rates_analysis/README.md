# Watch Rate Analysis

## Author: Merel van Buren
 
## The goal of the project
The aim of this project is to clean and analyze data about TikTok Watch Rates. Looking at variables such as "watch_seconds", "action", and  "creator_id". 

## Environment & dependencies 
### Folder structure
The relevant files and folder are organised as follows: TikTok-project-2026-2027-group1/ 
├── data/ 
│ └── output/ 
│ └── raw/ 
├── documents/ (not relevant to this analysis) 
├── fig_outputs/ 
├── scripts/ (not relevant to this analysis) 
├── src/ 
│ └── watch_rates_analysis/ 
│ ├── watch_rate_analysis_script.R 
│ ├── raw_data_script.R 
│ └── Makefile 
├── .gitignore 
├── README.md

### Dependencies
You will need:
- R (version 4.6.1 recommended) to run the R scripts
- R packages:
    - tidyverse
    - Within tidyverse packages: ggplot2, lubridate, dplyr here
- GNU Make: to run the Makefile
- These folders must exsist:
    - src/watch_rates_analysis (for scripts and makefile)
    - data/raw/ (for the Raw CSV file)
    - data/output/ (for the clean CSV file)
    - fig_outputs/ (for output images; this is created by the script if missing)

## Reproduction of the analysis 
To run this analysis you can use the **makefile**. To run the makefile navigate to your terminal and run *make*. This should run the file "raw_data_script.R" and "watch_rates_analysis_script.R". The files "action_plot.png", "watch_seconds_plot.png", "watch_seconds_per_action_plot.png", and "best_creator_plot.png" should be produced and found in fig_outputs/.

**Optional**: You can run the files "raw_data_script.R" and "watch_rates_analysis_script.R" yourself through R, if you would like to check out the script or make edits to it. 

## Troubleshooting
- If you get errors about missing folders or data, confirm you are in the correct working directory and that your project structure matches the diagram above.
- If package errors occur, make sure that the package has been installed and loaded by running *install.packages()* and *library()*