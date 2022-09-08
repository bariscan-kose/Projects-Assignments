import json
import os
import shutil
from typing import List, Tuple

import pandas as pd
import pysftp

from .model import Activity


def get_sftp_info(credentials: str) -> Tuple[List[Activity], List[Activity]]:
    with open(credentials) as credentials_file:
        credentials_info = json.load(credentials_file)

        my_hostname = credentials_info["my_hostname"]
        my_username = credentials_info["my_username"]
        my_password = credentials_info["my_password"]

    location = "./files/"
    dir_out = "outreach"
    dir_part = "partnerships"

    os.makedirs(os.path.join(location, dir_out), exist_ok=True)
    os.makedirs(os.path.join(location, dir_part), exist_ok=True)

    with pysftp.Connection(
        host=my_hostname,
        username=my_username,
        password=my_password,
    ) as sftp:
        # Switch to a remote directory
        sftp.cwd("./data/Dailydata/REDACTED/")
        for attr in sftp.listdir():
            sftp.get(remotepath=attr, localpath=os.path.join(location, dir_out, attr))
        sftp.cwd("../REDACTED/")
        for attr in sftp.listdir():
            sftp.get(remotepath=attr, localpath=os.path.join(location, dir_part, attr))
        sftp.close()

    combined_outreach = pd.concat(
        [
            pd.read_csv(f"./files/outreach/{filename}")
            for filename in os.listdir("./files/outreach/")
        ]
    )
    combined_partnerships = pd.concat(
        [
            pd.read_csv(f"./files/partnerships/{filename}")
            for filename in os.listdir("./files/partnerships/")
        ]
    )

    combined_outreach = combined_outreach.rename(
        columns={
            "user.Email": "user_Email",
            "sentToMTA.Timestamp": "sentToMTA_Timestamp",
            "render.Timestamp": "render_Timestamp",
            "click.Timestamp": "click_Timestamp",
            "unsubscribe.Timestamp": "unsubscribe_Timestamp",
            "group.Name": "group_Name",
            "message.Name": "message_Name",
            "record.Timestamp": "record_Timestamp",
            "record.Type": "record_Type",
            "record.sentToMTA.Timestamp": "record_sent_ToMTA_Timestamp",
            "feedback.Timestamp": "feedback_Timestamp",
            "render.GeoLocation.Latitude": "render_GeoLocation_Latitude",
            "render.GeoLocation.Longitude": "render_GeoLocation_Longitude",
            "click.GeoLocation.Latitude": "click_GeoLocation_Latitude",
            "click.GeoLocation.Longitude": "click_GeoLocation_Longitude",
        }
    )
    combined_partnerships = combined_partnerships.rename(
        columns={
            "user.Email": "user_Email",
            "sentToMTA.Timestamp": "sentToMTA_Timestamp",
            "render.Timestamp": "render_Timestamp",
            "click.Timestamp": "click_Timestamp",
            "unsubscribe.Timestamp": "unsubscribe_Timestamp",
            "group.Name": "group_Name",
            "message.Name": "message_Name",
            "record.Timestamp": "record_Timestamp",
            "record.Type": "record_Type",
            "record.sentToMTA.Timestamp": "record_sent_ToMTA_Timestamp",
            "feedback.Timestamp": "feedback_Timestamp",
            "render.GeoLocation.Latitude": "render_GeoLocation_Latitude",
            "render.GeoLocation.Longitude": "render_GeoLocation_Longitude",
            "click.GeoLocation.Latitude": "click_GeoLocation_Latitude",
            "click.GeoLocation.Longitude": "click_GeoLocation_Longitude",
        }
    )

    path = os.path.join(location, dir_out)
    shutil.rmtree(path)

    path = os.path.join(location, dir_part)
    shutil.rmtree(path)

    if len(combined_outreach.columns) > 9 and len(combined_partnerships.columns) > 9:
        main_outreach = combined_outreach.to_dict("records")
        main_partnerships = combined_partnerships.to_dict("records")

        activities_outreach = [Activity(**activity) for activity in main_outreach]
        activities_partnerships = [
            Activity(**activity) for activity in main_partnerships
        ]

        return activities_outreach, activities_partnerships
    else:
        raise ValueError("Can't get SFTP info.")
