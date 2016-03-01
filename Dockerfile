FROM nubomedia/apps-baseimage:v1

MAINTAINER Nubomedia

ADD kurento-room-demo-6.3.2-SNAPSHOT.jar /tmp/kurento-room-demo-6.3.2-SNAPSHOT.jar
ADD keystore.jks /

EXPOSE 8443/tcp 8088/tcp 443/tcp
ENTRYPOINT java -jar /tmp/kurento-room-demo-6.3.2-SNAPSHOT.jar -Dkms.uris=[autodiscovery]
