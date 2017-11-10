#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters."
    echo "Expecting <usre name> <password>"
    exit
fi

NAME=$1
PASSWORD=$2

docker run -t -i \
      -e "STORM_TENANT=159221713"  \
      -e "STORM_USERNAME=$NAME" \
      -e "STORM_PASSWORD=$PASSWORD" \
      --net=host hpsoftware/stormrunner_load_generator
