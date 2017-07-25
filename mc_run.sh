#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')

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
docker run --name $NAME --hostname mc.aos.com --add-host DockerServer:$SERVER_IP --net demo-net -p 8094:8080 --shm-size=2g -d admpresales/mc:$TAG
