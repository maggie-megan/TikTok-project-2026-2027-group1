# TikTok User Analysis
This directory contains scripts to: 
- clean the user data, 
- generate user behaviors visualizations, 
- and automate the pipeline using Make

## Overview
This subproject inspects the user TikTok behavioral data. It handles raw data ingestion, applies basic data cleaning, visualizes user behavioral insights using 'ggplot2', and exports the graphics.

## Input and Dependencies
- **Input Data**: `data/users.csv` (contains user identifiers and behavioral traits)
- **Required Libraries**: tidyverse (ggplot2, dplyr, readr)

## Project output:
Visualization artifacts saved in `gen/output/`:
- `logins_distribution.png`: Baseline login frequency distribution.
- `content_preferences.png`: Mean preference scores across categories.
- `logins_vs_videos.png`: Login frequency vs. mean videos watched scatter plot.
- `interaction_density.png`: Interaction needs density distribution.
- `satiation_vs_videos.png`: Satiation decay rate vs. total videos watched scatter plot.

## Key Behavioral Insights
- *Login Distribution*: Baseline login activity follows a standard bell-shaped (normal) distribution, centered around a mean frequency score of -0.8.
- *Category Preferences*: Comedy and Food rank highest as the only categories with positive average preference scores, while Beauty scores the lowest among users.
- *Login Frequency vs. Watch Volume*: Baseline login frequency shows zero correlation with total video consumption, with average watch volume remaining flat at approximately 44 videos regardless of login score.
- *Interaction Needs*: User demand for interactive features follow a uniform distribution across scores of -1.2 to 1.2 (flat density at ~0.37), showing an even spread of interaction needs rather than a dominant user cluster.
- *Content Satiation Decay*: Satiation decay rates (ranging from 0.75 to 0.96) show zero linear correlation with total videos watched, showing that content fatigue occurs independently of overall consumption volume.

## How to run the analysis
Navigate to this directory in your terminal and run the Makefile:
```bash
make
```