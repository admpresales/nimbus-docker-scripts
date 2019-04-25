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

# This will poll the container's status
docker stats ${CONTAINERS}
