R = Rscript

.PHONY: all clean

all: \
    fig_outputs/session_duration.png \
    fig_outputs/impression_volume_hourly.png \
    fig_outputs/recommendation_method_total_score.png \
    fig_outputs/user_saitiation.png \
    fig_outputs/top_creator_total_score.png \
    fig_outputs/logins_distribution.png \
    fig_outputs/content_preferences.png \
    fig_outputs/logins_vs_videos.png \
    fig_outputs/interaction_density.png \
    fig_outputs/satiation_vs_videos.png \
    data/output/clean_watch_events.csv \
    fig_outputs/action_plot.png \
    fig_outputs/best_creator_plot.png \
    fig_outputs/watch_seconds_per_action_plot.png \
    fig_outputs/watch_seconds_plot.png


# -------------------------
# Session duration analysis
# -------------------------

fig_outputs/session_duration.png: data/sessions.csv src/session_analysis/visualize_data.R
	cd src/session_analysis && $(R) visualize_data.R

data/sessions.csv: src/session_analysis/download_data.R
	cd src/session_analysis && $(R) download_data.R


# -------------------------
# Impressions analysis
# -------------------------

data/raw/impressions.csv: src/analysis_impressions/raw_data_impressions.R
	cd src/analysis_impressions && $(R) raw_data_impressions.R

fig_outputs/impression_volume_hourly.png \
fig_outputs/recommendation_method_total_score.png \
fig_outputs/user_saitiation.png \
fig_outputs/top_creator_total_score.png: src/analysis_impressions/impressions_analysis.R data/raw/impressions.csv
	cd src/analysis_impressions && $(R) impressions_analysis.R


# -------------------------
# User analysis
# -------------------------

data/raw/users.csv: src/tiktok_analysis/download_data.R
	cd src/tiktok_analysis && $(R) download_data.R
	if not exist data\raw mkdir data\raw
	copy src\tiktok_analysis\data\users.csv data\raw\users.csv

fig_outputs/logins_distribution.png \
fig_outputs/content_preferences.png \
fig_outputs/logins_vs_videos.png \
fig_outputs/interaction_density.png \
fig_outputs/satiation_vs_videos.png: src/tiktok_analysis/analyze_data.R data/raw/users.csv
	cd src/tiktok_analysis && $(R) analyze_data.R

# -------------------------
# Watch rates analysis
# -------------------------

data/raw/watch_events.csv: src/watch_rates_analysis/raw_data_script.R
	cd src/watch_rates_analysis && $(R) raw_data_script.R

data/output/clean_watch_events.csv \
fig_outputs/action_plot.png \
fig_outputs/best_creator_plot.png \
fig_outputs/watch_seconds_per_action_plot.png \
fig_outputs/watch_seconds_plot.png: src/watch_rates_analysis/watch_rates_analysis_script.R data/raw/watch_events.csv
	cd src/watch_rates_analysis && $(R) watch_rates_analysis_script.R


# -------------------------
# Clean generated files
# -------------------------

clean:
	rm -f fig_outputs/*.png
	rm -f data/raw/impressions.csv
	rm -f data/raw/users.csv
	rm -f data/raw/watch_events.csv
	rm -f data/output/clean_watch_events.csv
	rm -f data/sessions.csv