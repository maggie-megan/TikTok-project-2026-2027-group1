R = "C:/Program Files/R/R-4.6.1/bin/Rscript.exe"

.PHONY: all

all: fig_outputs/session_duration.png

fig_outputs/session_duration.png: data/sessions.csv src/session_analysis/visualize_data.R
	$(R) src/session_analysis/visualize_data.R

data/sessions.csv: src/session_analysis/download_data.R
	$(R) src/session_analysis/download_data.R