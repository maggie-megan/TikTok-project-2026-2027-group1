all: ../../data/output/clean_watch_events.csv ../../fig_outputs/action_plot.png ../../fig_outputs/best_creator_plot.png ../../fig_outputs/watch_seconds_per_action_plot.png ../../fig_outputs/watch_seconds_plot.png

../../data/raw/watch_events.csv: raw_data_script.R
	Rscript raw_data_script.R

../../data/output/clean_watch_events.csv ../../fig_outputs/action_plot.png ../../fig_outputs/best_creator_plot.png ../../fig_outputs/watch_seconds_per_action_plot.png ../../fig_outputs/watch_seconds_plot.png: watch_rates_analysis_script.R ../../data/raw/watch_events.csv
	Rscript watch_rates_analysis_script.R

