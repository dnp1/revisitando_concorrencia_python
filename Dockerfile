FROM python:3.12.1-slim-buster as base_linux
RUN pip install -U pip setuptools pipenv;

RUN apt-get update \
    && apt-get install gcc -y libc-dev build-essential\
    && apt-get clean

FROM base_linux as base_pipenv
ENV PIPENV_VENV_IN_PROJECT=1
WORKDIR /app/
COPY ./Pipfile.lock ./Pipfile /app/
RUN  pipenv install --deploy

FROM base_pipenv


ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY --from=base_pipenv /app/.venv /app/.venv
COPY ./ /app
ENV PATH="/app/.venv/bin:$PATH"

RUN  apt install stress -y


ENV PWPWORKERS 1
