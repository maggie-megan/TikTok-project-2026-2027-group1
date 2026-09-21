# Makefile for running impressions_analysis.R and generating plots only if needed

all: fig_outputs/impression_volume_hourly.png \
     fig_outputs/recommendation_method_total_score.png \
     fig_outputs/user_saitiation.png \
     fig_outputs/top_creator_total_score.png

fig_outputs/impression_volume_hourly.png \
fig_outputs/recommendation_method_total_score.png \
fig_outputs/user_saitiation.png \
fig_outputs/top_creator_total_score.png: impressions_analysis.R ../../data/raw/impressions.csv
	Rscript impressions_analysis.R

clean:
	rm -f fig_outputs/*.png

