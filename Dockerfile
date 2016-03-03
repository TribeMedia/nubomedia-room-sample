FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

ADD keystore.jks /
RUN mkdir -p /home/nubomedia/.m2
ADD settings.xml /home/nubomedia/.m2
ADD kurento-room-demo/ /home/nubomedia/kurento-room-demo
RUN cd /home/nubomedia/kurento-room-demo && mvn compile

EXPOSE 8443/tcp 8088/tcp 443/tcp
ENTRYPOINT cd /home/nubomedia/kurento-room-demo && mvn exec:java -Dkms.uris=["autodiscovery"]
