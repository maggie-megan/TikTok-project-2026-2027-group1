all: ../../fig_outputs/logins_distribution.png \
     ../../fig_outputs/content_preferences.png \
     ../../fig_outputs/logins_vs_videos.png \
     ../../fig_outputs/interaction_density.png \
     ../../fig_outputs/satiation_vs_videos.png

../../fig_outputs/logins_distribution.png \
../../fig_outputs/content_preferences.png \
../../fig_outputs/logins_vs_videos.png \
../../fig_outputs/interaction_density.png \
../../fig_outputs/satiation_vs_videos.png: analyze_data.R ../../data/raw/users.csv
	mkdir -p ../../fig_outputs
	Rscript analyze_data.R

clean:
	rm -rf ../../fig_outputs/*.png