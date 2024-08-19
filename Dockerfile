FROM python:3.12.1
RUN pip install poetry
COPY . /src
WORKDIR /src
RUN poetry install
EXPOSE 5432
