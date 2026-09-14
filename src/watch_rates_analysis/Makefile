all: output/action_plot.png output/best_creator_plot.png output/watch_seconds_per_action_plot.png output/watch_seconds_plot.png

data/watch_events.csv: data_script.R
	Rscript data_script.R

output/action_plot.png output/best_creator_plot.png output/watch_seconds_per_action_plot.png output/watch_seconds_plot.png: r_script.R data/watch_events.csv
	Rscript r_script.R
