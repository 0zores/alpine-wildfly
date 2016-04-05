FROM alpine
MAINTAINER Thiago Ozores <thiago@ozor.es>

ENV WILDFLY_VERSION 10.0.0.Final
ENV JDK_VERSION 8

ENV WILDFLY_HOME /opt/wildfly
ENV DOWNLOAD_LOCATION http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz

ADD $DOWNLOAD_LOCATION $WILDFLY_HOME/wildfly-$WILDFLY_VERSION.tar.gz
ADD bootstrap.sh /bootstrap.sh

WORKDIR $WILDFLY_HOME

RUN apk update && \
    apk add openjdk$JDK_VERSION && \
    tar xzvf wildfly-$WILDFLY_VERSION.tar.gz && \
    cp -Rvf wildfly-$WILDFLY_VERSION/* $WILDFLY_HOME && \
    rm -rf wildfly-$WILDFLY_VERSION wildfly-$WILDFLY_VERSION.tar.gz && \
    chmod +x /bootstrap.sh 

CMD ["/bootstrap.sh"]