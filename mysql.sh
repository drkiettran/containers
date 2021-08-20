#!/bin/bash

export EXT_PORT_NO=3306
export INT_PORT_NO=3306
export IMAGE_NAME=mysql:latest
export CONTAINER_NAME=mysql

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
docker network create cisc525-network
 
# Start container
docker run --restart=always -d \
-p 3306:3306 \
--net cisc525-network \
-e MYSQL_ROOT_PASSWORD=password \
--name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
