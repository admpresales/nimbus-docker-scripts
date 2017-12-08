#!/bin/bash

SERVER_IP=$(grep -i 'NimbusServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')
if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="alm"
fi


if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi


#docker run --name $NAME --hostname alm.aos.com --net demo-net -p 8082:8080 --shm-size=2g -d --add-host DockerServer:$SERVER_IP admpresales/alm:$TAG
docker run -d -p 8082:8080 -p 1521:1521 --name $NAME --hostname alm.aos.com --net demo-net --shm-size=2g admpresales/alm:$TAG
