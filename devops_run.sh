#!/bin/bash

SERVER_IP=$(grep -i 'DockerServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')
CLIENT_IP=$(grep -i 'DockerClient' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')

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


docker run -d -p 8090:8080 -p 50000:50000 -p 9022:22 --name $NAME --hostname devops.aos.com --net demo-net \
--add-host DockerServer.aos.com:$SERVER_IP --add-host DockerServer:$SERVER_IP --add-host DockerClient:$CLIENT_IP \
admpresales/devops:$TAG
