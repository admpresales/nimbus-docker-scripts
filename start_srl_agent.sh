
docker run -t -i \
-e "STORM_DISABLE_AUTO_REGISTER=1" \
--net=host performancetesting/stormrunner_load_generator

# The current working folder is: /opt/testexec.server/stormagent
