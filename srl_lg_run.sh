#!/bin/bash

docker run -t -i \
      -e "STORM_TENANT=159221713"  \
      -e "STORM_USERNAME=shahar.shiff@hpe.com" \
      -e "STORM_PASSWORD=Dagnahash3#" \
      --net=host performancetesting/stormrunner_load_generator:latest


