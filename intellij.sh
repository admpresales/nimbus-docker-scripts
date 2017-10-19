#!/bin/bash

if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="intellij"
fi

if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi


docker run -d --name $NAME -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --net "host" -p 8824:8824 -p 5095:5095 admpresales/intellij:$TAG
