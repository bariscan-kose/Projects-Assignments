FROM python:3.9

WORKDIR /app

RUN pip install --quiet poetry

COPY pyproject.toml poetry.lock /app/
RUN poetry install --quiet --no-interaction --no-root --no-dev

COPY . /app
RUN poetry install --quiet --no-interaction --no-dev

ENTRYPOINT [ "poetry", "run", "mapp"]
