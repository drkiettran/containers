#!/bin/bash

export IMAGE_NAME=rabbitmq:3
export MGT_IMAGE_NAME=rabbitmq:3-management
export CONTAINER_NAME=rabbitmq3
export MGT_CONTAINER_NAME=rabbitmq3-mgt
export HOST_NAME=rabbitmq3-host
export MGT_HOST_NAME=rabbitmq3-host-mgt

# Pull latest container
docker pull $IMAGE_NAME
docker pull $MGT_IMAGE_NAME
 
# Start container
docker run -d --hostname $HOST_NAME \
	-v /home/student/certs:/certs \
	-e RABBITMQ_SSL_CERTFILE=/certs/server-cert.pem \
	-e RABBITMQ_SSL_KEYFILE=/certs/server-priv-key.pem \
	-e RABBITMQ_SSL_CACERTFILE=/certs/ca_bundle.pem \
	-e RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT=true \
	-e RABBITMQ_SSL_VERIFY=verify_peer \
	--name $CONTAINER_NAME $IMAGE_NAME

docker run -d --hostname $MGT_HOST_NAME \
	-v /home/student/certs:/certs \
	-e RABBITMQ_MANAGEMENT_SSL_CERTFILE=/certs/server-cert.pem \
	-e RABBITMQ_MANAGEMENT_SSL_KEYFILE=/certs/server-priv-key.pem \
	-e RABBITMQ_MANAGEMENT_SSL_CACERTFILE=/certs/ca_bundle.pem \
	-e RABBITMQ_MANAGEMENT_SSL_FAIL_IF_NO_PEER_CERT=false \
	-e RABBITMQ_MANAGEMENT_SSL_VERIFY=verify_peer \
	--name $MGT_CONTAINER_NAME $MGT_IMAGE_NAME

#docker logs --follow $CONTAINER_NAME


## ---
# docker run -d --hostname my-rabbit --name some-rabbit -p 5671:5671 -p 5672:5672 -p 15671:15671  -e RABBITMQ_NODENAME=rabbitnode -e RABBITMQ_DEFAULT_TCP=false -e RABBITMQ_DEFAULT_USER=admin  -e RABBITMQ_DEFAULT_PASS=admin  -e RABBITMQ_ERLANG_COOKIE=6a8ef42097f82602b9d9bc4c27dbe8bd -e RABBITMQ_DEFAULT_VHOST=test -e RABBITMQ_VM_MEMORY_HIGH_WATERMARK=1500MiB -e RABBITMQ_SSL_CERT_FILE=/certs/server_certificate.pem -e RABBITMQ_SSL_KEY_FILE=/certs/server_key.pem -e RABBITMQ_SSL_CA_FILE=/certs/ca_certificate.pem -e RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT=false -e RABBITMQ_SSL_VERIFY=verify_peer -v /home/ubuntu/rabbitmq-tls/:/certs/ rabbitmq:3-management

## ---
