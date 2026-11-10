import click
import pandas as pd
from sqlalchemy import URL, create_engine


ZONE_CSV_URL = "https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv"


@click.command()
@click.option("--pg-user", default="root")
@click.option("--pg-pass", default="root")
@click.option("--pg-host", default="pgdatabase")
@click.option("--pg-port", default=5432, type=int)
@click.option("--pg-db", default="ny_taxi")
@click.option("--target-table", default="zone")
def run(pg_user, pg_pass, pg_host, pg_port, pg_db, target_table):
    connection_url = URL.create(
        "postgresql+psycopg",
        username=pg_user,
        password=pg_pass,
        host=pg_host,
        port=pg_port,
        database=pg_db,
    )

    df = pd.read_csv(
        ZONE_CSV_URL,
        dtype={
            "LocationID": "Int64",
            "Borough": "string",
            "Zone": "string",
            "service_zone": "string",
        },
    )

    engine = create_engine(connection_url)
    try:
        df.to_sql(
            name=target_table,
            con=engine,
            if_exists="replace",
            index=False,
        )
    finally:
        engine.dispose()

    click.echo(f"Loaded {len(df)} rows into {target_table}")


if __name__ == "__main__":
    run()