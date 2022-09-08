"""Script for interacting with BigQuery and file saving"""
import json
import logging
import sys
from datetime import date, datetime, timezone
from typing import Any, Dict, Iterable, List, Mapping, Optional, Sequence, Type

from google.cloud import bigquery
from google.cloud.exceptions import BadRequest
from pydantic import BaseModel

from .model import Activity

logging.basicConfig(level=logging.INFO)


def log_errors(errors: Optional[Iterable[Mapping]], kind: str) -> None:
    """Print "$KIND ERROR: $error" using `logging.error` for each $error in `errors`."""
    if errors is None:
        return
    for e in errors:
        logging.error(f"{kind.upper()} ERROR: {e['message']}")


def save_to_file(outfile: str, activities: List[Activity]) -> None:
    """Saves contents into json files for debugging purpose.
    Returns:
        None.
    """
    with open(outfile, mode="w", encoding="utf-8") as file:
        json.dump(file, to_dict_list(activities))


def convert_json_types(d: Dict[str, Any]) -> Dict[str, Any]:
    """Converts datetime and date to string to conform with Json serialization"""
    for k in d:
        if isinstance(d[k], datetime) or isinstance(d[k], date):
            d[k] = str(d[k])
        if isinstance(d[k], dict):
            d[k] = convert_json_types(d[k])
    return d


def to_dict_list(lst: Sequence[BaseModel]) -> List[Dict[str, Any]]:
    """Receives a BaseModel class and passes its fields
    and values to convert_json_types function"""
    return [convert_json_types(x.dict()) for x in lst]


def get_bq_schema(cls: Type[BaseModel]) -> List[bigquery.SchemaField]:
    """Returns schema of BaseModel class in a way that conforms to BigQuery"""
    types = {
        "string": "STRING",
        "integer": "INTEGER",
        "date-time": "TIMESTAMP",
        "number": "FLOAT",
    }

    schema = cls.schema(by_alias=False)
    fields: List[bigquery.SchemaField] = []

    for name, attr in schema["properties"].items():
        typ = attr["format"] if attr.get("format") else attr["type"]
        if typ not in types:
            raise ValueError(f"Invalid attribute type: {typ}")
        fields.append(bigquery.SchemaField(name, types[typ]))

    return fields


def check_bq_table(
    client: bigquery.Client, bq_table: str, cls: Type[BaseModel]
) -> bigquery.SchemaField:
    """Checks if a BigQuery table is available and creates new if not"""
    schema = get_bq_schema(cls)

    project = client.project
    new_table = bigquery.Table(f"{project}.{bq_table}", schema=schema)
    client.create_table(new_table, exists_ok=True)

    return schema


def backup_table(client: bigquery.Client, table: str, expiration_days: int = 3) -> None:
    """Copy `table` to `table_$now` (same dataset) where $now is %Y%m%d.

    The table expires after `expiration_days` from $now.
    """
    now = datetime.now(tz=timezone.utc).strftime("%Y%m%dT%H%M")
    backup_name = f"{table}_bkp_{now}"
    bkp_job = client.query(
        f"""
        CREATE TABLE {backup_name}
        OPTIONS(
            expiration_timestamp=TIMESTAMP_ADD(
                CURRENT_TIMESTAMP(),
                INTERVAL {expiration_days} DAY
            )
        )
        AS (
            SELECT *
            FROM {table}
        )
        """
    )
    try:
        logging.info(f"Backing up table to: {backup_name}")
        bkp_job.result()
        logging.info("BACKUP DONE")
    except BadRequest as e:
        logging.error(e)
        log_errors(bkp_job.errors, "backup")
        sys.exit(1)


def load_activities(dataset: str, table: str, items: List[Activity]) -> None:
    """Loads message activities to BigQuery"""
    client = bigquery.Client(project="REDACTED")

    bq_table_temp = f"{dataset}.{table}_temp"
    bq_table = f"{dataset}.{table}"
    bq_table_temp_full = f"REDACTED.{dataset}.{table}_temp"
    bq_table_full = f"REDACTED.{dataset}.{table}"

    schema = check_bq_table(client, bq_table, Activity)
    check_bq_table(client, bq_table_temp, Activity)
    backup_table(client, bq_table_full)

    rows = to_dict_list(items)
    logging.info("LOADING NEW DATA")
    job_config = bigquery.LoadJobConfig(
        schema=schema, write_disposition="WRITE_TRUNCATE"
    )
    job = client.load_table_from_json(rows, bq_table_temp, job_config=job_config)
    try:
        job.result()
        logging.info(f"LOAD TABLE {bq_table_temp} FROM FILE DONE!")
    except BadRequest as e:
        logging.error(e)
        log_errors(job.errors, "load")
        sys.exit(1)

    query_job = client.query(
        f"""
        MERGE {bq_table_full} main_table
        USING {bq_table_temp_full} temp_table
        ON main_table.user_Email = temp_table.user_Email
        AND main_table.sentToMTA_Timestamp = temp_table.sentToMTA_Timestamp
        AND main_table.render_Timestamp = temp_table.render_Timestamp
        AND main_table.click_Timestamp = temp_table.click_Timestamp
        AND main_table.unsubscribe_Timestamp = temp_table.unsubscribe_Timestamp
        AND main_table.group_Name = temp_table.group_Name
        AND main_table.message_Name = temp_table.message_Name
        AND main_table.record_Timestamp = temp_table.record_Timestamp
        AND main_table.record_Type = temp_table.record_Type
        AND
    main_table.record_sentToMTA_Timestamp = temp_table.record_sentToMTA_Timestamp
        AND main_table.feedback_Timestamp = temp_table.feedback_Timestamp
        AND
    main_table.render_GeoLocation_Latitude = temp_table.render_GeoLocation_Latitude
        AND
    main_table.render_GeoLocation_Longitude = temp_table.render_GeoLocation_Longitude
        AND
    main_table.click_GeoLocation_Latitude = temp_table.click_GeoLocation_Latitude
        AND
    main_table.click_GeoLocation_Longitude = temp_table.click_GeoLocation_Longitude
        WHEN MATCHED THEN
            UPDATE SET
                user_Email = temp_table.user_Email,
                sentToMTA_Timestamp = temp_table.sentToMTA_Timestamp,
                render_Timestamp = temp_table.render_Timestamp,
                click_Timestamp = temp_table.click_Timestamp,
                unsubscribe_Timestamp = temp_table.unsubscribe_Timestamp,
                group_Name = temp_table.group_Name,
                message_Name = temp_table.message_Name,
                record_Timestamp = temp_table.record_Timestamp,
                record_Type = temp_table.record_Type,
                record_sentToMTA_Timestamp = temp_table.record_sentToMTA_Timestamp,
                feedback_Timestamp = temp_table.feedback_Timestamp,
                render_GeoLocation_Latitude = temp_table.render_GeoLocation_Latitude,
                render_GeoLocation_Longitude = temp_table.render_GeoLocation_Longitude,
                click_GeoLocation_Latitude = temp_table.click_GeoLocation_Latitude,
                click_GeoLocation_Longitude = temp_table.click_GeoLocation_Longitude
        WHEN NOT MATCHED THEN
            INSERT (
                user_Email,
                sentToMTA_Timestamp,
                render_Timestamp,
                click_Timestamp,
                unsubscribe_Timestamp,
                group_Name,
                message_Name,
                record_Timestamp,
                record_Type,
                record_sentToMTA_Timestamp,
                feedback_Timestamp,
                render_GeoLocation_Latitude,
                render_GeoLocation_Longitude,
                click_GeoLocation_Latitude,
                click_GeoLocation_Longitude
            )
            VALUES (
                temp_table.user_Email,
                temp_table.sentToMTA_Timestamp,
                temp_table.render_Timestamp,
                temp_table.click_Timestamp,
                temp_table.unsubscribe_Timestamp,
                temp_table.group_Name,
                temp_table.message_Name,
                temp_table.record_Timestamp,
                temp_table.record_Type,
                temp_table.record_sentToMTA_Timestamp,
                temp_table.feedback_Timestamp,
                temp_table.render_GeoLocation_Latitude,
                temp_table.render_GeoLocation_Longitude,
                temp_table.click_GeoLocation_Latitude,
                temp_table.click_GeoLocation_Longitude
            )
        """
    )

    try:
        logging.info("MERGING NEW DATA")
        query_job.result()
        logging.info("MERGE DONE")
    except BadRequest as e:
        logging.error(e)
        log_errors(query_job.errors, "merge")
        sys.exit(1)
    finally:
        client.delete_table(bq_table_temp_full)
