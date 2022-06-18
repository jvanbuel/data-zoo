.PHONY: deps data

KAGGLE_DATASET := "maltegrosse/8-m-spotify-tracks-genre-audio-features"

deps:
	poetry install 

data: deps
	kaggle datasets download -d $(KAGGLE_DATASET); \
	unzip -o *.zip -d data; \
	rm *.zip

hooks:
	pre-commit install 

	

