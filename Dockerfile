FROM python:3.7.0 as base
WORKDIR /app

FROM base as dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM dependencies as build
WORKDIR /app
COPY . /app

FROM python:3.7.0-alpine as dev
WORKDIR /app
COPY --from=dependencies /root/.cache /root/.cache
COPY --from=build /app /app
RUN pip install -r requirements-dev.txt && rm -rf /root/.cache

FROM python:3.7.0-alpine as test
WORKDIR /app
COPY --from=dependencies /root/.cache /root/.cache
COPY --from=build /app /app
RUN pip install -r requirements-test.txt && rm -rf /root/.cache
