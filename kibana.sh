#!/bin/bash
 
export EXT_PORT_NO=5601
export INT_PORT_NO=5601
export IMAGE_NAME=docker.elastic.co/kibana/kibana-oss:7.6.1
export CONTAINER_NAME=kibana

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
# docker volume create --name kibana_data
 
# -e elasticsearch.hosts=http://localhost:9200 \

# Start container
docker run --restart=always -d \
-e ELASTICSEARCH_HOSTS=http://$1:9200 \
-p $EXT_PORT_NO:$INT_PORT_NO \
--name $CONTAINER_NAME -t $IMAGE_NAME
 
docker logs --follow $CONTAINER_NAME
