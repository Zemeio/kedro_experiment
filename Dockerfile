FROM python:3.8-slim

COPY new-kedro-project/src/requirements.txt .
RUN pip install -r requirements.txt

env PYTHONUNBUFFERED 1


WORKDIR /app
COPY . .
WORKDIR /app/new-kedro-project
RUN kedro run

EXPOSE 4141
CMD kedro viz --host 0.0.0.0 --port 4141

