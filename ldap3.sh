#!/bin/bash
export IMAGE_NAME=openidentityplatform/opendj
export CONTAINER_NAME=opendj
export CONTAINER_HOSTNAME=ldap01.domain.com
export BASE_DN=dc=inflinx,dc=com

# Pull latest container
docker pull $IMAGE_NAME

# Start container
docker run -h $CONTAINER_HOSTNAME -p 1389:1389 -p 1636:1636 -p 4444:4444 \
-e BASE_DN=$BASE_DN --name $CONTAINER_NAME -t $IMAGE_NAME

# docker run -h ldap-01.domain.com -p 1389:1389 -p 1636:1636 -p 4444:4444 \
# --name ldap-01 openidentityplatform/opendj

docker logs --follow $CONTAINER_NAME
