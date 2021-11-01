#!/bin/bash

# function, property, port:
# http port, nifi.web.http.port, 8080
# https port, nifi.web.https.port, 8443
# remote input socket port, nifi.remote.input.socket.port, 10000
# jvm debugger, java.arg.debug, 8000

# Need a network cisc520-network created.
# need to run redis first.

export EXT_PORT_NO=8282
export INT_PORT_NO=8080
export IMAGE_NAME=bitnami/airflow-scheduler:latest
export CONTAINER_NAME=airflow-scheduler

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
 
# Start container

docker run -d --name $CONTAINER_NAME -p $EXT_PORT_NO:$INT_PORT_NO \
 -e AIRFLOW_FERNET_KEY=46BKJoQYlPPOexq0OhDZnIlNepKFf87WFwLbfzqDDho= \
 -e AIRFLOW_SECRET_KEY=a25mQ1FHTUh3MnFRSk5KMEIyVVU2YmN0VGRyYTVXY08= \
 -e AIRFLOW_EXECUTOR=CeleryExecutor \
 -e AIRFLOW_WEBSERVER_HOST=airflow \
 -e AIRFLOW_WEBSERVER_PORT_NUMBER=8080 \
 -e AIRFLOW_DATABASE_NAME=bitnami_airflow \
 -e AIRFLOW_DATABASE_HOST=postgres \
 -e AIRFLOW_DATABASE_PORT_NUMBER=5432 \
 -e AIRFLOW_DATABASE_USERNAME=postgres \
 -e AIRFLOW_DATABASE_PASSWORD=password \
 -e AIRFLOW_LOAD_EXAMPLES=yes \
 --net cisc520-network \
 $IMAGE_NAME

#  --volume airflow_scheduler_data:/bitnami \

docker logs --follow $CONTAINER_NAME
