#!/bin/bash

export EXT_PORT_NO=8080
export INT_PORT_NO=8080
export IMAGE_NAME=artifact_sharing:latest
export CONTAINER_NAME=artifact_sharing

# Pull latest container
docker pull $IMAGE_NAME
 
# *** You must create a volume `certs` *** as follows
# docker volume create --name certs
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-e MYSQL_ROOT_PASSWORD=password \
--mount source=certs,destination=/certs,readonly \
--name $CONTAINER_NAME -t $IMAGE_NAME

# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \

# docker exec -it mysql mysql -u root -p
# docker exec -it mysql mysql -u sonar -p
# create user 'sonar'@'localhost' identified by 'sonar'
# grant all privileges on *.* to 'sonar'@'localhost';
 
docker logs --follow $CONTAINER_NAME
