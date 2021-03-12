FROM python:3.8.8

RUN apt-get update && apt-get install -y \
    vim \
    ssh \
    git

RUN mkdir /root/.cache/black/20.8b1 -p

WORKDIR /home/work

COPY poetry.lock pyproject.toml ./

RUN pip install poetry

RUN poetry config virtualenvs.create false && poetry install
