#!/bin/bash

export EXT_PORT_NO=49004
export INT_PORT_NO=9000
export IMAGE_NAME=sonarqube
export CONTAINER_NAME=sonarqube

# NEED TO RUN THIS FIRST: sudo sysctl -w vm.max_map_count=262144

# postql:
# psql -h localhost -p 49003 -U postgres
# create user sonar with password 'sonar';
# create database sonar;
# have to use docker inspect postgres | grep -i ip 
# to find the ip address of the postsql. there is a better way.
#

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name sonarqube_data

# default login: admin/admin
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v sonarqube_data:/opt/sonarqube \
-e sonar.jdbc.username=sonar \
-e sonar.jdbc.password=sonar \
-e sonar.jdbc.url="jdbc:postgresql://172.17.0.1:49003/sonar" \
--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow $CONTAINER_NAME
