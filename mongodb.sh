#!/bin/bash
 
export EXT_PORT_NO=27017
export INT_PORT_NO=27017
export IMAGE_NAME=mongo:latest
export CONTAINER_NAME=mongo

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name mongo_data
docker network create cisc525-network
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
--net cisc525-network \
-v mongo_data:/data/db \
-v ~/cisc525:/cisc525 \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
