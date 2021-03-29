#!/bin/bash

export EXT_GW_PORT_NO=8080
export INT_GW_PORT_NO=8080
export EXT_ADMIN_PORT_NO=9876
export INT_ADMIN_PORT_NO=9876
export IMAGE_NAME=express-gateway
export CONTAINER_NAME=express-gateway

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
 
# Start container
docker run -d \
-p $EXT_GW_PORT_NO:$INT_GW_PORT_NO \
-p $EXT_ADMIN_PORT_NO:$INT_ADMIN_PORT_NO \
--name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
