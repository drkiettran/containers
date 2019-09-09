#!/bin/bash
 
export EXT_PORT_NO=49002
export INT_PORT_NO=8081
export IMAGE_NAME=docker.bintray.io/jfrog/artifactory-oss:latest
export CONTAINER_NAME=artifactory

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
export CONTAINER_NAME=artifactory
docker volume create --name artifactory_data
# chmod -R 777 $HOST_ARTIFACTORY_HOME
# default login admin/password
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v artifactory_data:/var/opt/jfrog/artifactory \
--name $CONTAINER_NAME -t $IMAGE_NAME
# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow artifactory
