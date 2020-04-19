## First Stage
#FROM python:3.7.0 as base
#ENV APPLICATION_ROOT /app/
#COPY requirements.txt .
#RUN pip install -r requirements.txt

# Second Stage
FROM python:3.7.0-alpine as dev
ENV APPLICATION_ROOT /app/
#COPY --from=base /root/.cache /root/.cache
#COPY --from=base /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages
COPY . $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT
RUN pip install -r requirements-dev.txt && rm -rf /root/.cache
