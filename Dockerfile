FROM python:3.7.0 as base
ENV APPLICATION_ROOT /app/
COPY requirements.txt .
COPY . $APPLICATION_ROOT
RUN pip install -r requirements.txt

FROM python:3.7.0-alpine as dev
ENV APPLICATION_ROOT /app/
COPY --from=base /root/.cache /root/.cache
COPY --from=base $APPLICATION_ROOT $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT
RUN pip install -r requirements-dev.txt && rm -rf /root/.cache

FROM python:3.7.0-alpine as test
ENV APPLICATION_ROOT /app/
COPY --from=base /root/.cache /root/.cache
COPY --from=base $APPLICATION_ROOT $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT
RUN pip install -r requirements-test.txt && rm -rf /root/.cache
