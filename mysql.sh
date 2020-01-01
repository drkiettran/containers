#!/bin/bash

export EXT_PORT_NO=3306
export INT_PORT_NO=3306
export IMAGE_NAME=mysql/mysql-server
export CONTAINER_NAME=mysql

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name mysql_data
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-e MYSQL_ROOT_PASSWORD=password \
--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \

# docker exec -it mysql mysql -u root -p
# docker exec -it mysql mysql -u sonar -p
# create user 'sonar'@'localhost' identified by 'sonar'
# grant all privileges on *.* to 'sonar'@'localhost';
 
docker logs --follow $CONTAINER_NAME
