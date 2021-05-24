#!/bin/bash

export IMAGE_NAME=rabbitmq:3
export MGT_IMAGE_NAME=rabbitmq:3-management
export CONTAINER_NAME=rabbitmq3
export MGT_CONTAINER_NAME=rabbitmq3-mgt
export HOST_NAME=rabbitmq3-host

# Pull latest container
docker pull $IMAGE_NAME
docker pull $MGT_IMAGE_NAME
 
# Start container
docker run -d --hostname $HOSTNAME --name $CONTAINER_NAME $IMAGE_NAME
docker run -d --hostname $HOSTNAME --name $MGT_CONTAINER_NAME $MGT_IMAGE_NAME

#docker logs --follow $CONTAINER_NAME
