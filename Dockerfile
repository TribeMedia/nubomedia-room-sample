FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

RUN sudo chown -R nubomedia:nubomedia /home/nubomeda
USER 1000
RUN mkdir -p /home/nubomedia/.m2
ADD settings.xml /home/nubomedia/.m2/
RUN git clone https://github.com/Kurento/kurento-java.git /home/nubomedia/kurento-java
RUN cd /home/nubomedia/kurento-java $$ mvn install -DskipTests -Pdefault
ADD kurento-room-demo/ /home/nubomedia/kurento-room-demo
RUN cd /home/nubomedia/kurento-room-demo && mvn compile

EXPOSE 8443/tcp 8088/tcp 443/tcp
ENTRYPOINT cd /home/nubomedia/kurento-room-demo && mvn exec:java -Dkms.uris=["autodiscovery"]
