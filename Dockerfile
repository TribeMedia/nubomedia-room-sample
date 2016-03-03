FROM nubomedia/apps-baseimage:v1

MAINTAINER Nubomedia

ADD keystore.jks /
RUN mkdir ~/.m2
ADD settings.xml ~/.m2
ADD kurento-room-demo/ /tmp/kurento-room-demo
RUN cd /tmp/kurento-room-demo && mvn compile

ENTRYPOINT cd /tmp/kurento-room-demo && mvn exec:java
