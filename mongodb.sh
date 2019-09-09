#!/bin/bash
 
export EXT_PORT_NO=27017
export INT_PORT_NO=27017
export IMAGE_NAME=mongo
export CONTAINER_NAME=mongo

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name mongo_data
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v mongo_data:/data/db \
--name $CONTAINER_NAME -t $IMAGE_NAME
# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow mongo
