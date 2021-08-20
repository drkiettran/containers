#!/bin/bash
 
export IMAGE_NAME=fluentd:v1.9.1-debian-1.0
export CONTAINER_NAME=fluentd

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker network create cisc525-network

 
# Start container
docker run --restart=always -d \
--net cisc525-network \
-p 24224:24224 -p 24224:24224/udp -u fluent \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
