# Data Zoo

The purpose of this project is to try out and compare a variety of data analysis engines, such as Pandas, Polars, DuckDB, and (Py)Spark.

The dataset is a 5GB sqlite DB with Spotify data (artists, albums, tracks, genres, ...).

Questions that I'd like to investigate:

- performance/speed: how fast do the queries execute? Although there is an [benchmark study](https://h2oai.github.io/db-benchmark/) by H2O.ai, it's never a bad idea to perform an independent validation 🙂
- efficiency: can we prune partitions of the data? Are queries executed lazily or eagerly?
- cloud compatibility: can we read/write data from and to AWS, Azure, Google Cloud, etc?
- input formats: which input format can be read by the tool?


### Make targets

- deps: install all dependencies with poetry
- data: fetch Spotify dataset from Kaggle 
- hooks: install pre-commit hooks in repo
- duckdb: build duckdb cli and sqlitescanner extension from [source](https://github.com/duckdblabs/sqlitescanner) 

## DuckDB

Reading in directly the sqlite dump is only possible when you build the custom sqlitescanner extension, together with the duckdb CLI and then use the CLI to load the extension and read in the data. This is a bit cumbersome, but it works. However, for our purpose, we want to use the DuckDB Python binding and not the CLI. Not sure if it is possible to load the extension 