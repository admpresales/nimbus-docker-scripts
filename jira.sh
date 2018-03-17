#!/bin/bash

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
docker run -d -p 8099:8080 --name $NAME --hostname jira.aos.com --net demo-net admpresales/jira:$TAG
