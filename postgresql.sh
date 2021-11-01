#!/bin/bash

export EXT_PORT_NO=5432
export INT_PORT_NO=5432
export IMAGE_NAME=docker.io/postgres
export CONTAINER_NAME=postgres

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name postgresql_data
# docker volume create --driver local --opt type=tmpfs --opt device=tmpfs --opt o=rw pgvol
# docker network create cisc520-network
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
	--net cisc520-network \
	-v pgvol:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password \
	--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow $CONTAINER_NAME
