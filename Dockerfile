FROM alpine
MAINTAINER Thiago Ozores <thiago@ozor.es>

RUN mkdir -p /opt/wildfly && \
    apk update && \
    apk add unzip openjdk8 && \
    wget -c http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.zip && \
    unzip wildfly-10.0.0.Final.zip -d /opt/wildfly && \