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

duckdb:
	git clone --recurse-submodules git@github.com:duckdblabs/sqlitescanner.git;\
	cd sqlitescanner && $(MAKE) duckdb_release release

parquet:
	python scripts/convert_sqlite_to_parquet.py

	

