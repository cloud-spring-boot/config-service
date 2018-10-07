#!/bin/sh
echo "********************************************************"
echo "Waiting for the Eureka to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z eureka $EUREKASERVER_PORT `; do sleep 3; done
echo ">>>>>>>>>>>> Eureka has started"

echo "********************************************************"
echo "Starting config-service "
echo "********************************************************"
java \
-Djava.security.egd=file:/dev/./urandom \
-Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI \
-jar /usr/local/config-service/@project.build.finalName@.jar