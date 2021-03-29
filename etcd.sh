#!/bin/bash

export EXT_PORT_NO=2380
export INT_PORT_NO=2380
export EXT_ADMIN_PORT_NO=2379
export INT_ADMIN_PORT_NO=2379
export IMAGE_NAME=bitnami/etcd:latest
export CONTAINER_NAME=etcd-server

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
 
# start a network
docker network create app-tier --driver bridge

# Start container
docker run --restart=always -d \
	--network app-tier \
	-p $EXT_PORT_NO:$INT_PORT_NO \
	-p $EXT_ADMIN_PORT_NO:$INT_ADMIN_PORT_NO \
	-e ALLOW_NONE_AUTHENTICATION=yes \
	-e ETCD_ADVERTISE_CLIENT_URLS=http://etcd-server:$EXT_ADMIN_EXT_PORT_NO \
	--name $CONTAINER_NAME \
	-t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
# Testing etcd, use this:
# docker run -it --rm --network app-tier --env ALLOW_NONE_AUTHENTICATION=yes bitnami/etcd:latest etcdctl --endpoints http://etcd-server:2379 put /Message Hello

docker logs --follow $CONTAINER_NAME
