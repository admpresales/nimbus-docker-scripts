docker run -t -i \
      -e "STORM_TENANT=159221713"  \
      -e "STORM_USERNAME=shahar.shiff@hpe.com" \
      -e "STORM_PASSWORD=FuckSh1t" \
      --net=host hpsoftware/stormrunner_load_generator
