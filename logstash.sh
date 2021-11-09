#!/bin/bash
 
export IMAGE_NAME=logstash:7.14.0
export CONTAINER_NAME=logstash

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create logstashvol
# docker network create cisc520-network
 
# Start container
docker run --restart=always -d \
	-e "xpack.security.enabled=false" \
	--net cisc520-network \
	-v logstashvol:/usr/share/logstash/pipeline \
	--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
