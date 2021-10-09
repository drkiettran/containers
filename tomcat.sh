#!/bin/bash

export EXT_PORT_NO=$1
export INT_PORT_NO=8080
export IMAGE_NAME=tomcat:9.0
export CONTAINER_NAME=tomcat

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker network create cisc525-network
 
# Start container
docker run --restart=always -d \
-p $EXT_PORT_NO:$INT_PORT_NO \
--net cisc525-network \
--name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
