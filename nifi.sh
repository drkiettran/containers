#!/bin/bash

# function, property, port:
# http port, nifi.web.http.port, 8080
# https port, nifi.web.https.port, 8443
# remote input socket port, nifi.remote.input.socket.port, 10000
# jvm debugger, java.arg.debug, 8000
# create nifi volume using this cli:
# docker volume create nifivol **** DONT USE THIS ***
# USE THIS at command prompt: mkdir ~/nifivol


# Need a network cisc520-network created.

export EXT_PORT_NO=8443
export INT_PORT_NO=8443
export IMAGE_NAME=apache/nifi
export CONTAINER_NAME=nifi

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
 
# Start container
 docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
	-v ~/nifivol:/nifidata \
	--net cisc520-network \
	--name $CONTAINER_NAME -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
