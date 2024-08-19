import glob
import os
from typing import Dict, Optional

import pandas as pd
import psycopg2
from dotenv import load_dotenv
from sqlalchemy import create_engine


def connect_to_postgres(
    db_params: Dict[str, str]
) -> Optional[psycopg2.extensions.connection]:
    """Connect to PostgreSQL and return the connection object."""
    try:
        conn = psycopg2.connect(
            host=db_params["HOST"],
            database=db_params["DATABASE"],
            user=db_params["USER"],
            password=db_params["PASSWORD"],
        )
        print("Connected to PostgreSQL successfully.")
        return conn

    except Exception as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None


def create_schema(conn: psycopg2.extensions.connection) -> None:
    """Create a schema in the PostgreSQL database if it doesn't exist."""
    try:
        cur = conn.cursor()
        conn.set_session(autocommit=True)
        cur.execute("CREATE SCHEMA IF NOT EXISTS erp")
        print("Schema 'erp' created or already exists.")
        cur.close()

    except Exception as e:
        print(f"Error creating schema: {e}")


def get_engine(db_params: Dict[str, str]) -> Optional[create_engine]:
    """Create and return a SQLAlchemy engine."""
    try:
        # db_params["database"] = "northwind"
        engine = create_engine(
            f'postgresql://{db_params["USER"]}:{db_params["PASSWORD"]}@{db_params["HOST"]}/{db_params["DATABASE"]}'
        )
        print("SQLAlchemy engine created successfully.")
        return engine

    except Exception as e:
        print(f"Error creating SQLAlchemy engine: {e}")
        return None


def load_csv_files(data_folder: str) -> Optional[Dict[str, str]]:
    """Load CSV files from the folder and return a dictionary of file names and paths."""
    try:
        csv_paths = glob.glob(os.path.join(data_folder, "*.csv"))
        csv_files = {
            os.path.splitext(os.path.basename(file))[0]: file for file in csv_paths
        }
        print(f"Found {len(csv_files)} CSV files in the folder.")
        return csv_files

    except Exception as e:
        print(f"Error loading CSV files: {e}")
        return None


def display_csv_contents(csv_files: Dict[str, str]) -> None:
    """Display the first two rows of each CSV file."""
    try:
        for table_name, file_path in csv_files.items():
            df = pd.read_csv(file_path, delimiter=";", encoding="utf-8")
            print(f"Contents of '{table_name}' CSV file:")
            print(df.head(2))
            print("\n")

    except Exception as e:
        print(f"Error displaying CSV contents: {e}")


def insert_csv_into_postgres(csv_files: Dict[str, str], engine: create_engine) -> None:
    """Insert the contents of each CSV file into the PostgreSQL database."""
    try:
        for table_name, file_path in csv_files.items():
            df = pd.read_csv(file_path, delimiter=";", encoding="utf-8")
            df = df.astype(str)  # Convert all columns to strings
            df.to_sql(
                table_name, engine, if_exists="replace", index=False, schema="erp"
            )
            print(f"Inserted data from {table_name}.csv into PostgreSQL.")

    except Exception as e:
        print(f"Error inserting data into PostgreSQL: {e}")


def main(data_folder: str, db_params: Dict[str, str]) -> None:
    """Main function to orchestrate data loading and insertion into PostgreSQL."""
    conn = connect_to_postgres(db_params)
    if not conn:
        return

    create_schema(conn)

    engine = get_engine(db_params)
    if not engine:
        return

    csv_files = load_csv_files(data_folder)
    if not csv_files:
        return

    display_csv_contents(csv_files)
    insert_csv_into_postgres(csv_files, engine)

    conn.close()
    print("PostgreSQL connection closed.")


if __name__ == "__main__":
    data_folder = "./data/"

    load_dotenv()

    db_params = {
        "HOST": os.getenv("POSTGRES_HOST"),
        "DATABASE": os.getenv("POSTGRES_DB"),
        "USER": os.getenv("POSTGRES_USER"),
        "PASSWORD": os.getenv("POSTGRES_PASSWORD"),
    }

    main(data_folder=data_folder, db_params=db_params)
