#!/bin/bash

export EXT_PORT_NO=8000
export INT_PORT_NO=8000
export IMAGE_NAME=jupyterhub/jupyterhub
export CONTAINER_NAME=jupyterhub

# Pull latest container
docker pull $IMAGE_NAME
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
--name $CONTAINER_NAME -t $IMAGE_NAME $CONTAINER_NAME

# docker run -p 8000:8000 -d --name jupyterhub jupyterhub/jupyterhub jupyterhub

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \

docker logs --follow $CONTAINER_NAME
