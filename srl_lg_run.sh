docker run -t -i \
      -e "STORM_TENANT=159221713"  \
      -e "STORM_USERNAME=" \
      -e "STORM_PASSWORD=" \
      --net=host hpsoftware/stormrunner_load_generator
