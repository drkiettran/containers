#!/bin/bash
 
export IMAGE_NAME=elasticsearch:7.14.0
export CONTAINER_NAME=elasticsearch
export NETWORK_NAME=cisc525-network

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker network create cisc525-network
 
# Start container
docker run --restart=always -d \
--net cisc525-network \
-p 9200:9200 -p 9300:9300 \
-e "discovery.type=single-node" \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
