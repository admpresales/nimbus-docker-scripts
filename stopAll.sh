#!/bin/bash

# This script uses nimbusadmin to stop running containers at once.
# It will not stop autopass

# for special case (aos actully kick starts 3 containers)
STOP_AOS=0

function stopContainer()
{
  echo "nimbusapp $container stop"
  nimbusapp ${container} stop
}

docker ps --format "table {{.Names}}" | awk '{print $1}' | while read container; do
  case $container in
    aos_*)
    container="aos"
    if [ $STOP_AOS -eq 0 ]; then
      stopContainer
      STOP_AOS=1
    fi
    continue
    ;;
    devops* | octane* | mc* | alm* | intellij* | nv* | ppm* | da* | ssc* | jira* | sv* | agm*)
    stopContainer
    ;;
    NAMES)
    # DONT_STOP
    continue
    ;;
    autopass)
    # DONT_STOP
    continue
    ;;
    *)
    echo "Unknown container '$container', skipping..."
    continue
    ;;
  esac
sleep 2
done
