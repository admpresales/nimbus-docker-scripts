#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')

if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="octane"
fi


if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi

docker run --name $NAME --hostname octane.aos.com --net demo-net -p 8085:8080 --add-host DockerServer:$SERVER_IP --add-host DockerServer.aos.com:$SERVER_IP \
--shm-size=2g -p 9081:9081 -p 9082:9082 -p 1099:1099 -d admpresales/octane:$TAG

