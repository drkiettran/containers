#!/bin/bash

export EXT_PORT_NO=9443
export INT_PORT_NO=9443
export IMAGE_NAME=wso2/wso2is:5.7.0
#export IMAGE_NAME=wso2/wso2is:latest --> causing CORS issue
export CONTAINER_NAME=wso2is

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
# uid/psw = admin/admin

# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v /tmp:/tmp \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
