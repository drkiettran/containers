#!/bin/bash
 
# Pull latest container
# docker pull jenkins/jenkins:lts
 
# Setup local configuration folder
# Should already be in a jenkins folder when running this script.
# default login admin/admin

export CONFIG_FOLDER=$PWD/config
mkdir $CONFIG_FOLDER
chown 1000 $CONFIG_FOLDER
 
# Start container
docker run --restart=always -u root -d -p 49001:8080 -p 5000:5000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $CONFIG_FOLDER:/var/jenkins_home:z \
-v $(which docker):/usr/bin/docker \
-v /etc/sysconfig:/etc/sysconfig \
--privileged --name jenkins \
-t getintodevops/jenkins-withdocker:lts
# -t drtran/jenkins-with-docker:lts
# -t jenkins/jenkins:lts 
 
docker logs --follow jenkins
