
docker run -d --name leanft -p 5095:5095 -p 5900:5900 -e LFT_LIC_SERVER=localhost -e LFT_LIC_ID=23078 -e VERBOSE=true --net "host" functionaltesting/leanft-chrome:14.01
