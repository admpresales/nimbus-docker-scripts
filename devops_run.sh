#!/bin/bash

SERVER_IP=$(grep -i 'NimbusServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')
CLIENT_IP=$(grep -i 'NimbusClient' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')

if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="devops"
fi


if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi

#docker run -d -p 8090:8080 \
#-p 8091:80 \
#-p 50000:50000 \
#-p 9022:22 \
#--name $NAME \
#--hostname devops.aos.com \
#--net demo-net \
#--add-host nimbussever:172.50.0.1 \
#admpresales/devops:$TAG

docker run -d -p 8090:8080 \
-p 8091:80 \
-p 50000:50000 \
-p 9022:22 \
--name $NAME \
--hostname devops.aos.com \
--net demo-net \
--add-host nimbusserver:172.50.0.1 \
--add-host nimbusserver.aos.com:172.50.0.1 \
admpresales/devops:$TAG

