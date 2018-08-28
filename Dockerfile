FROM python:3.7.0 as base
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.7.0-alpine as test
COPY --from=base /root/.cache /root/.cache
COPY --from=base requirements.txt .
COPY requirements-test.txt .
RUN pip install -r requirements-test.txt && rm -rf /root/.cache

FROM python:3.7.0-alpine as dev
COPY --from=base /root/.cache /root/.cache
COPY --from=base requirements.txt .
COPY requirements-dev.txt .
RUN pip install -r requirements-dev.txt && rm -rf /root/.cache
