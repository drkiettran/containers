#!/bin/bash
 
export EXT_PORT_NO=49010
export INT_PORT_NO=8888
export IMAGE_NAME=jupyter/all-spark-notebook
export CONTAINER_NAME=all-spark-notebook

# Pull latest container
docker pull $IMAGE_NAME
 
# Start container
docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
-v ~/cisc525:/cisc525 \
--name $CONTAINER_NAME -t $IMAGE_NAME
# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow $CONTAINER_NAME
