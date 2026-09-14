all: gen/output/logins_distribution.png \
     gen/output/content_preferences.png \
     gen/output/logins_vs_videos.png \
     gen/output/interaction_density.png \
     gen/output/satiation_vs_videos.png

gen/output/logins_distribution.png \
gen/output/content_preferences.png \
gen/output/logins_vs_videos.png \
gen/output/interaction_density.png \
gen/output/satiation_vs_videos.png: analyze_data.R data/users.csv
	Rscript analyze_data.R

clean:
	rm -rf gen/output/*.png