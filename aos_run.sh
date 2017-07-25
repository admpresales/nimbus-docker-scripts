#!/bin/sh

#  aos.sh
#  
#
#  Created by Shahar Shiff on 3/9/17.
#

# Postgres DB
docker run -d -p 5432:5432 --name aos_postgres --hostname aosdb.aos.com --net demo-net admpresales/aos:postgres

# Web and a[plication server
docker run -d -p 8000:8000 -p 8009:8009 --net demo-net --name aos_tomcat --hostname aosweb.aos.com --add-host DockerServer:192.168.9.196 admpresales/aos:tomcat


# If you want to login to the database and get into psql, login to the image (docker exec -it postgres /bin/bash) and then login as the postgres user (su postgres) with password 
# mercury123.


#exit;
