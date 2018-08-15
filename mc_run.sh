#!/bin/bash

SERVER_IP=$(grep -i 'NimbusServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')
HOST_NAME=$(hostname)

if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="mc"
fi

if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi

##To start the MC container:
docker run -d --hostname nimbusserver.aos.com --name $NAME \
--net demo-net -p 8084:8084 --shm-size=2g admpresales/mc:$TAG
