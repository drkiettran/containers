#!/bin/bash
 
export IMAGE_NAME=logstash:7.14.0
export CONTAINER_NAME=logstash

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name logstash_pipeline
docker network create cisc520-network
 
# Start container
docker run --restart=always -d \
	-e "xpack.security.enabled=false" \
	--net cisc520-network \
	-v logstash_pipeline:/usr/share/logstash/pipeline \
	--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
