#!/bin/bash

export IMAGE_NAME=kong
export CONTAINER_NAME=kong

# Pull latest container
docker pull $IMAGE_NAME
 
# docker network create cisc525-network
 
# Start container
docker run -d --name $CONTAINER_NAME \
    -e "KONG_DATABASE=off" \
    -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
    -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
    -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
    -p 7000:8000 \
    -p 7443:8443 \
    -p 7001:8001 \
    -p 7444:8444 \
    $IMAGE_NAME

# docker run --restart=always -d \
# -p 3306:3306 \
# --net cisc525-network \
# -e MYSQL_ROOT_PASSWORD=password \
# --name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
