#!/bin/bash

export HOST_NAME=activemq
export IMAGE_NAME=rmohr/activemq:latest
export CONTAINER_NAME=activemq

#docker run -d --hostname $HOST_NAME -p 8161:8161 \
#	-v /tmp:/tmp \
#	--name $CONTAINER_NAME $IMAGE_NAME
docker network create cisc525-network 

docker run -d --hostname $HOST_NAME \
    --net cisc525-network \
	-v /home/student/certs:/certs \
	-v /home/student/python/activemq/conf:/opt/activemq/conf \
	--name $CONTAINER_NAME $IMAGE_NAME


#### --- OLD METHOD -------------
# export EXT_UI_PORT=8161
# export INT_UI_PORT=8161
# export EXT_JMS_PORT=61616
# export INT_JMS_PORT=61616
# export EXT_AMQP_PORT=5672
# export INT_AMQP_PORT=5672
# export EXT_STOMP_PORT=61613
# export INT_STOMP_PORT=61613
# export EXT_MQTT_PORT=1883
# export INT_MQTT_PORT=1883
# export EXT_WS_PORT=61614
# export INT_WS_PORT=61614

# export IMAGE_NAME=rmohr/activemq:latest
# export CONTAINER_NAME=activemq

# Pull latest container
# docker pull $IMAGE_NAME
 
#           -v /opt/activemq/persistent/dir/conf:/opt/activemq/conf \
#           -v /opt/activemq/persistent/dir/data:/opt/activemq/data \
# Start container
# docker run \
	   # -p $EXT_UI_PORT:$EXT_UI_PORT \
	   # -p $EXT_JMS_PORT:$EXT_JMS_PORT \
	   # -p $EXT_AMQP_PORT:$EXT_AMQP_PORT \
	   # -p $EXT_STOMP_PORT:$EXT_STOMP_PORT \
	   # -p $EXT_MQTT_PORT:$EXT_MQTT_PORT \
	   # -p $EXT_WS_PORT:$EXT_WS_PORT \
	   # --name $CONTAINER_NAME \
           # -t $IMAGE_NAME

##  docker logs --follow $CONTAINER_NAME
