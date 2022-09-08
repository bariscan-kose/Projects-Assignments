"""Defines Activity class"""
from datetime import datetime
from typing import Optional

from numpy import isnan
from pydantic import BaseModel, validator


class Activity(BaseModel):
    """Class for holding message related user-attributes"""

    user_Email: Optional[str]
    sentToMTA_Timestamp: Optional[datetime]
    render_Timestamp: Optional[datetime]
    click_Timestamp: Optional[datetime]
    unsubscribe_Timestamp: Optional[datetime]
    group_Name: Optional[str]
    message_Name: Optional[str]
    record_Timestamp: Optional[datetime]
    record_Type: Optional[str]
    record_sentToMTA_Timestamp: Optional[datetime]
    feedback_Timestamp: Optional[datetime]
    render_GeoLocation_Latitude: Optional[float]
    render_GeoLocation_Longitude: Optional[float]
    click_GeoLocation_Latitude: Optional[float]
    click_GeoLocation_Longitude: Optional[float]

    @validator("*", pre=True)
    def change_nan_to_none(cls, v, field):
        if type(v) is float and isnan(v):
            return None
        elif type(v) is str and len(v) <= 1:
            return None
        elif type(v) is datetime and len(v) <= 1:
            return None
        return v

    class Config:
        """Configures for ignoring extra parameters passed and attribute aliases"""

        anystr_strip_whitespace = True
        extra = "ignore"
        allow_population_by_field_name = True
