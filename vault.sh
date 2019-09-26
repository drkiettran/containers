#!/bin/bash
 
export EXT_PORT_NO=8200
export INT_PORT_NO=8200
export IMAGE_NAME=vault
export CONTAINER_NAME=vault

# Pull latest container
docker pull $IMAGE_NAME
 
# Setup local configuration folder
 
# Start container
docker run --restart=always --cap-add=IPC_LOCK -d -p $EXT_PORT_NO:$INT_PORT_NO \
-e 'VAULT_LOCAL_CONFIG={"backend": {"file": {"path": "/vault/file"}}, "default_lease_ttl": "168h", "max_lease_ttl": "720h"}' \
-v ~/cisc525:/cisc525 \
--name $CONTAINER_NAME $IMAGE_NAME 

# docker run --restart=always -d -p $EXT_PORT_NO:$INT_PORT_NO \
# -v mongo_data:/data/db \
# -v ~/cisc525:/cisc525 \
# --name $CONTAINER_NAME -t $IMAGE_NAME
# -e http_proxy='http://proxy.com:8080' \
# -e https_proxy='http://proxy.com:8080' \
 
docker logs --follow $CONTAINER_NAME
