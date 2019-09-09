#!/bin/bash

export EXT_PORT_NO=49007
export INT_PORT_NO=8080
export IMAGE_NAME=owasp/dependency-track
export CONTAINER_NAME=dependency-track

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name dependency_track_data
# default login admin/admin --> admin/password
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v dependency_track_data:/data \
--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow $CONTAINER_NAME
