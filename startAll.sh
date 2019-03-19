#!/bin/bash

# This script uses nimbusadmin to start a bunch of containers at once.
# Usage: ./startAll.sh [container1 container2 container3...]

CONTAINERS=""

while (( "$#" )); do
  echo "nimbusapp $1 start"
  nimbusapp $1 start
  if [ "$1" = "aos" ]; then
    CONTAINERS="$CONTAINERS aos_main aos_accountservice aos_postgres"
  else
    CONTAINERS="$CONTAINERS $1"
  fi
  shift 1
done

docker stats ${CONTAINERS}

#/home/demo/SRF\ Tunnels/3.0/ftaas-tunnel -config /home/demo/SRF\ Tunnels/3.0/config/AMSPresalesWS.json
