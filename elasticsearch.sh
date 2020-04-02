#!/bin/bash
 
export EXT_PORT_NO=9200
export INT_PORT_NO=9200
export IMAGE_NAME=docker.elastic.co/elasticsearch/elasticsearch-oss:7.6.1
export CONTAINER_NAME=elasticsearch

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker volume create --name elasticsearch_data
 
# Start container
docker run --restart=always -d \
-p 9200:9200 -p 9300:9300 \
-e "discovery.type=single-node" \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
