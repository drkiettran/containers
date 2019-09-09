#!/bin/bash
 
export EXT_PORT_NO=49009
export INT_PORT_NO=8080
export IMAGE_NAME=camunda/camunda-bpm-platform:latest
export CONTAINER_NAME=camunda

# Pull latest container
docker pull $IMAGE_NAME
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow camunda
