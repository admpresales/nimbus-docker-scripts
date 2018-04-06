#!/bin/bash

#SERVER_IP=$(grep -i 'NimbusServer' /etc/hosts | grep -v "127" | grep -v "#" | awk '{print $1}')
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

##To start the NV container:
docker run -d -i --cap-add=NET_ADMIN --name $NAME --net=host --privileged -v /usr/src:/usr/src admpresales/nv:$TAG \
/root/dockerentrypointfile.sh
