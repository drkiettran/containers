#!/bin/bash

export EXT_PORT_NO=$1
export INT_PORT_NO=$1
export IMAGE_NAME=apache/nifi
export CONTAINER_NAME=$2

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-e NIFI_WEB_HTTP_PORT=$EXT_PORT_NO \
--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \

# docker exec -it mysql mysql -u root -p
# docker exec -it mysql mysql -u sonar -p
# create user 'sonar'@'localhost' identified by 'sonar'
# grant all privileges on *.* to 'sonar'@'localhost';
 
docker logs --follow $CONTAINER_NAME
