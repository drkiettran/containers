#!/bin/bash

export EXT_PORT_NO=3306
export INT_PORT_NO=3306
export IMAGE_NAME=fluentd
export CONTAINER_NAME=fluentd

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
 
# Start container
# do chmod 777 -R /home/student/fluentd
# do chown -R /home/student/fluentd

docker run -p 24224:24224 -p 24224:24224/udp --name $CONTAINER_NAME -v /home/student/fluentd/log:/fluentd/log -t $IMAGE_NAME

docker logs --follow $CONTAINER_NAME
