"""Command line interface for module
"""

import click

from .repository import load_activities, save_to_file
from .sftp import get_sftp_info


@click.command()
@click.option(
    "--dataset", type=str, help="BigQuery dataset for loading results", default="test"
)
@click.option(
    "--credentials",
    type=click.Path(readable=True),
    help="Path that contains SFTP credentials",
    default="./mapp_sftp/sftp_credentials.json",
)
@click.option(
    "--debug",
    type=bool,
    is_flag=True,
    help="Debug results instead of uploading to BigQuery",
    default=False,
)
@click.option(
    "--outfile",
    type=click.Path(writable=True),
    help="Path to save debug file",
    default="../files/activities.json",
)
def update(
    dataset: str,
    credentials: str,
    debug: bool,
    outfile: str,
) -> None:
    """Entrypoint to the module
    1. Gets activities
    2. Load activities to BigQuery or saves to file for debugging
    """
    (
        activities_outreach,
        activities_partnerships,
    ) = get_sftp_info(credentials)

    if not debug and (activities_outreach or activities_partnerships):
        load_activities(dataset, "REDACTED", activities_outreach)
        load_activities(dataset, "REDACTED", activities_partnerships)
    else:
        save_to_file(outfile, activities_outreach)
        save_to_file(outfile, activities_partnerships)


if __name__ == "__main__":
    update()
