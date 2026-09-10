# TikTok User Analysis
This directory contains scripts to: 
- clean the user data, 
- generate baseline login distribution visualizations, 
- and automate the pipeline using Make

## Overview
This subproject inspects the user TikTok behavioral data. It handles raw data ingestion, applies basic data cleaning, visualizes user baseline login frequencies using 'ggplot2', and exports the graphics.

## Input and Dependencies
- **Input Data**: `data/users.csv` (contains user identifiers and behavioral traits)
- **Required Libraries**: tidyverse (ggplot2, dplyr, readr)

## Project output:
Histogram visualization of user baseline login frequencies: gen/output/logins_distribution.png

## How to run the analysis
Navigate to this directory in your terminal and run the Makefile:
```bash
make
```
