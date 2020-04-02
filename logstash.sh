#!/bin/bash
 
export EXT_PORT_NO=9200
export INT_PORT_NO=9200
export IMAGE_NAME=docker.elastic.co/logstash/logstash-oss:7.6.1
export CONTAINER_NAME=logstash

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name logstash_pipeline
 
# Start container
docker run --restart=always -d \
-e "xpack.security.enabled=false" \
-v logstash_pipeline:/usr/share/logstash/pipeline \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
