#!/bin/bash

SERVER_IP=$(grep -i 'NimbusServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')

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

docker run -d -p 1099:1099 -p 8085:8080 -p 9081:9081 -p 9082:9082 --name $NAME --hostname octane.aos.com --net demo-net \
-e OCTANE_HOST=nimbusserver.aos.com --shm-size=2g admpresales/octane:$TAG
