FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

ADD keystore.jks /
RUN mkdir -p /root/.m2
ADD settings.xml /root/.m2
ADD kurento-room-demo/ /root/kurento-room-demo
RUN cd /root/kurento-room-demo && mvn compile

EXPOSE 8443/tcp 8088/tcp 443/tcp
ENTRYPOINT cd /root/kurento-room-demo && mvn exec:java -Dkms.uris=["autodiscovery"]
