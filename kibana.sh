#!/bin/bash
 
export IMAGE_NAME=kibana:7.14.0
export CONTAINER_NAME=kibana

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
docker network create cisc525-network
 
# -e elasticsearch.hosts=http://localhost:9200 \

# Start container
docker run --restart=always -d \
--net cisc525-network \
-e ELASTICSEARCH_HOSTS=http://elasticsearch:9200 \
-p 5601:5601 \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
