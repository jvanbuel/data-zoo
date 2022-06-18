# Data Zoo

The purpose of this project is to try out and compare a variety of data analysis engines, such as Pandas, Polars, DuckDB, and (Py)Spark.

The dataset is a 5GB sqlite DB with Spotify data (artists, albums, tracks, genres, ...).

Questions that I'd like to investigate:

- performance/speed: how fast do the queries execute? Although there is an [benchmark study](https://h2oai.github.io/db-benchmark/) by H2O.ai, it's never a bad idea to perform an independent validation 🙂
- efficiency: can we prune partitions of the data? Are queries executed lazily or eagerly?
- cloud compatibility: can we read/write data from and to AWS, Azure, Google Cloud, etc?
- input formats: which input format can be read by the tool?
