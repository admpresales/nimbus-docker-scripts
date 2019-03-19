#!/bin/bash

# This script uses nimbusadmin to stop running containers at once.
# It will not stop autopass

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
    devops | octane | mc | alm | intellij | nv)
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
    echo "Unknown container '$container'"
    break
    ;;
  esac
sleep 2
done


exit 0

  if [ "$container" != "NAMES" ]; then
    if [ "$container" = "aos_main" ] || [ "$container" = "aos_postgres" ] || [ "$container" = "aos_accountservice" ]; then
      container="aos"
      echo "2..$container..$STOP_AOS.."
    fi
    if [ "$container" != "aos" ] ; then
      echo "nimbusapp $container stop"
      #nimbusapp ${container} stop
    elif [ "$STOP_AOS" -eq "0" ]; then
      echo "nimbusapp aos stop"
      #nimbusapp aos stop
      STOP_AOS=1
    fi
  fi



#echo "nimbusapp octane stop"
#nimbusapp octane stop
#echo "nimbusapp devops stop"
#nimbusapp devops stop
#echo "nimbusapp aos stop"
#nimbusapp aos stop
#echo "nimbusapp intellij stop"
#nimbusapp intellij stop
