
#!/bin/bash

docker run -d --hostname autopass.aos.com --ip=172.50.10.10 --name autopass --net demo-net -p 5814:5814 --restart=always admpresales/autopass:10.7.0_d

#docker run --name autopass --hostname autopass.aos.com --net demo-net -p 5814:5814 --ip=172.50.10.10 --restart=always -d admpresales/autopass:9.3_d

#docker run --name autopass --hostname autopass.aos.com --net demo-net -p 5814:5814 --ip=172.50.10.10 --restart=always -d hub.docker.hpecorp.net/hpepresales/autopass:9.3_d
