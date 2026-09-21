# TikTok Session Analysis

## Author: Mohammadjavad Ghandibaghbanzadeh

## The goal of the project

Clean and analyze data about TikTok sessions.

## Environment & dependencies Folder structure

In the folder src, you can find another folder containing the R code needed for this specific analysis. The data will be stored in the folder 'data', and the charts produced by the code will be stored in fig_outputs.

## Dependencies

You will need the following R packages:

-   readr

-   tidyverse

-   lubridate

## Reproduction of the analysis

Please run the makefile. Otherwise, please get the data using the data_script, and then proceed with the r_script.

The Makefile will:

-   Download the session data into the `data` folder.

-   Run the session analysis.

-   Create three `.png` visualizations in the `fig\_outputs` folder.
