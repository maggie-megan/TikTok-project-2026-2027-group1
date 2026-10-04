all: documents/report.pdf


# -------------------------
# Download data
# -------------------------

data/raw/sessions.csv: src/session_analysis/download_data.R
	Rscript src/session_analysis/download_data.R

data/raw/impressions.csv: src/analysis_impressions/raw_data_impressions.R
	Rscript src/analysis_impressions/raw_data_impressions.R

data/raw/users.csv: src/tiktok_analysis/download_data.R
	cd src/tiktok_analysis && Rscript download_data.R

data/raw/watch_events.csv: src/watch_rates_analysis/raw_data_script.R
	cd src/watch_rates_analysis && Rscript raw_data_script.R


# -------------------------
# Session analysis
# -------------------------

fig_outputs/session_duration.png: data/raw/sessions.csv src/session_analysis/visualize_data.R
	Rscript src/session_analysis/visualize_data.R

fig_outputs/videos_viewed_vs_session_duration.png: data/raw/sessions.csv src/session_analysis/visualize_data.R
	Rscript src/session_analysis/visualize_data.R

fig_outputs/sessions_by_login_hour.png: data/raw/sessions.csv src/session_analysis/visualize_data.R
	Rscript src/session_analysis/visualize_data.R


# -------------------------
# Impressions analysis
# -------------------------

fig_outputs/impression_volume_hourly.png: data/raw/impressions.csv src/analysis_impressions/impressions_analysis.R
	Rscript src/analysis_impressions/impressions_analysis.R

fig_outputs/recommendation_method_total_score.png: data/raw/impressions.csv src/analysis_impressions/impressions_analysis.R
	Rscript src/analysis_impressions/impressions_analysis.R

fig_outputs/user_satiation.png: data/raw/impressions.csv src/analysis_impressions/impressions_analysis.R
	Rscript src/analysis_impressions/impressions_analysis.R

fig_outputs/top_creator_total_score.png: data/raw/impressions.csv src/analysis_impressions/impressions_analysis.R
	Rscript src/analysis_impressions/impressions_analysis.R

data/output/clean_impressions.csv: data/raw/impressions.csv src/analysis_impressions/impressions_analysis.R
	Rscript src/analysis_impressions/impressions_analysis.R


# -------------------------
# User analysis
# -------------------------

fig_outputs/logins_distribution.png: data/raw/users.csv src/tiktok_analysis/analyze_data.R
	cd src/tiktok_analysis && Rscript analyze_data.R

fig_outputs/content_preferences.png: data/raw/users.csv src/tiktok_analysis/analyze_data.R
	cd src/tiktok_analysis && Rscript analyze_data.R

fig_outputs/logins_vs_videos.png: data/raw/users.csv src/tiktok_analysis/analyze_data.R
	cd src/tiktok_analysis && Rscript analyze_data.R

fig_outputs/interaction_density.png: data/raw/users.csv src/tiktok_analysis/analyze_data.R
	cd src/tiktok_analysis && Rscript analyze_data.R

fig_outputs/satiation_vs_videos.png: data/raw/users.csv src/tiktok_analysis/analyze_data.R
	cd src/tiktok_analysis && Rscript analyze_data.R


# -------------------------
# Watch rates analysis
# -------------------------

fig_outputs/action_plot.png: data/raw/watch_events.csv src/watch_rates_analysis/watch_rates_analysis_script.R
	cd src/watch_rates_analysis && Rscript watch_rates_analysis_script.R

fig_outputs/watch_seconds_plot.png: data/raw/watch_events.csv src/watch_rates_analysis/watch_rates_analysis_script.R
	cd src/watch_rates_analysis && Rscript watch_rates_analysis_script.R

fig_outputs/watch_seconds_per_action_plot.png: data/raw/watch_events.csv src/watch_rates_analysis/watch_rates_analysis_script.R
	cd src/watch_rates_analysis && Rscript watch_rates_analysis_script.R

fig_outputs/best_creator_plot.png: data/raw/watch_events.csv src/watch_rates_analysis/watch_rates_analysis_script.R
	cd src/watch_rates_analysis && Rscript watch_rates_analysis_script.R

data/output/clean_watch_events.csv: data/raw/watch_events.csv src/watch_rates_analysis/watch_rates_analysis_script.R
	cd src/watch_rates_analysis && Rscript watch_rates_analysis_script.R


# -------------------------
# Regression analysis
# -------------------------

fig_outputs/satiation_decay_regression.png \
fig_outputs/satiation_decay_expanded_plot.png: \
	data/raw/users.csv \
	src/Regression_analysis/regression_analysis.R
	cd src/Regression_analysis && Rscript regression_analysis.R


# -------------------------
# Final report
# -------------------------

documents/report.pdf: \
	fig_outputs/session_duration.png \
	fig_outputs/videos_viewed_vs_session_duration.png \
	fig_outputs/sessions_by_login_hour.png \
	fig_outputs/impression_volume_hourly.png \
	fig_outputs/recommendation_method_total_score.png \
	fig_outputs/user_satiation.png \
	fig_outputs/top_creator_total_score.png \
	fig_outputs/logins_distribution.png \
	fig_outputs/content_preferences.png \
	fig_outputs/logins_vs_videos.png \
	fig_outputs/interaction_density.png \
	fig_outputs/satiation_vs_videos.png \
	fig_outputs/action_plot.png \
	fig_outputs/watch_seconds_plot.png \
	fig_outputs/watch_seconds_per_action_plot.png \
	fig_outputs/best_creator_plot.png \
	fig_outputs/satiation_decay_regression.png \
	fig_outputs/satiation_decay_expanded_plot.png
	Rscript -e "if (!requireNamespace('png', quietly=TRUE)) install.packages('png', repos='https://cloud.r-project.org'); imgs <- c('fig_outputs/session_duration.png', 'fig_outputs/videos_viewed_vs_session_duration.png', 'fig_outputs/sessions_by_login_hour.png', 'fig_outputs/impression_volume_hourly.png', 'fig_outputs/recommendation_method_total_score.png', 'fig_outputs/user_satiation.png', 'fig_outputs/top_creator_total_score.png', 'fig_outputs/logins_distribution.png', 'fig_outputs/content_preferences.png', 'fig_outputs/logins_vs_videos.png', 'fig_outputs/interaction_density.png', 'fig_outputs/satiation_vs_videos.png', 'fig_outputs/action_plot.png', 'fig_outputs/watch_seconds_plot.png', 'fig_outputs/watch_seconds_per_action_plot.png', 'fig_outputs/best_creator_plot.png', 'fig_outputs/satiation_decay_regression.png', 'fig_outputs/satiation_decay_expanded_plot.png'); pdf('documents/report.pdf'); for (f in imgs) { plot.new(); rasterImage(png::readPNG(f), 0, 0, 1, 1) }; dev.off()"

# -------------------------
# Clean
# -------------------------

clean:
	del /Q data\*.csv
	del /Q fig_outputs\*.png
	del /Q *.pdf