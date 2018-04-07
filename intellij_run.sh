#!/bin/bash

# get the container name (first parameter)
if [ "$1" != "" ]; then
	NAME=$1
else
	NAME="intellij"
fi

# get the tag (second parameter)
if [ "$2" != "" ]; then
	TAG=$2
else
	TAG="latest"
fi

# declare the project folder (as constant)
#IDEA="IdeaProjects_docker"
IDEA="Documents/github"

# if the folder doesn't exist, create it so it is owned by the user
if [ ! -d "${HOME}/${IDEA}" ]
then
	mkdir ${HOME}/${IDEA}
fi

if [ ! -d "${HOME}/.m2" ]
then
        mkdir ${HOME}/.m2
fi

docker run -d --name $NAME \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${HOME}/.m2:/home/demo/.m2 \
-v ${HOME}/${IDEA}:/home/demo/IdeaProjects \
-e DISPLAY=unix$DISPLAY \
--net "host" \
-p 8824:8824 \
-p 5095:5095 \
admpresales/intellij:$TAG
