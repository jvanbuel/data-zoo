import sqlite3
import pandas as pd
from pathlib import Path
import logging


def main():
    logging.basicConfig(level=logging.INFO)

    cnx = sqlite3.connect(
        Path(__file__).parent.parent / "data" / "sqlite" / "spotify.sqlite"
    )
    table_names = pd.read_sql_query(
        "SELECT name FROM sqlite_schema WHERE type='table'", cnx
    )

    cnx.text_factory = lambda b: b.decode(
        errors="ignore"
    )  # to avoid UTF-8 encoding errors
    for table in table_names["name"]:

        logging.info(f"Converting {table} to parquet")

        pd.read_sql_query(f"SELECT * FROM {table}", cnx).to_parquet(
            Path(__file__).parent.parent / "data" / "parquet" / f"{table}.parquet"
        )


if __name__ == "__main__":
    main()
