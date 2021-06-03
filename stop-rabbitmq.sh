#!/bin/bash
docker stop rabbitmq3
docker stop rabbitmq3-mgt
docker rm rabbitmq3
docker rm rabbitmq3-mgt
