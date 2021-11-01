#!/bin/bash

# Need a network cisc520-network created.

export EXT_PORT_NO=6379
export INT_PORT_NO=6379
export IMAGE_NAME=bitnami/redis:latest
export CONTAINER_NAME=redis

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --driver local --opt type=tmpfs --opt device=tmpfs --opt o=rw redisvol
# Start container

docker run -d --name $CONTAINER_NAME -p $EXT_PORT_NO:$INT_PORT_NO \
 --net cisc520-network \
 -e ALLOW_EMPTY_PASSWORD=yes \
 -v redisvol:/bitnami \
 $IMAGE_NAME


# --volume /home/studento/airflow-persistence:/bitnami \

docker logs --follow $CONTAINER_NAME
