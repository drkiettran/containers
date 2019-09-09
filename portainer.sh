#!/bin/bash

export EXT_PORT_NO=49008
export INT_PORT_NO=9000
export IMAGE_NAME=docker.io/portainer/portainer
export CONTAINER_NAME=portainer

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create portainer_data
# default login admin/password
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data \
--name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
