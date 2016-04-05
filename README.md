# Alpine Wildfly

Docker image for run [Wildfly](http://wildfly.org) inside [Alpine Linux](http://www.alpinelinux.org), a lightweight Linux Distribution.

This image was built for a Proof of Concept, it is constantly updated, **so don't use it in a production environment.**

## Usage

To run image with default parameters, just:

```
docker run -t -d tozores\alpine-wildfly
```

If you want access the console or deployed applications from your machine, you must configure the port forwarding, for example:

```
docker run -t -d -p 8080:8080 -p 9990:9990 tozores\alpine-wildfly
```

By default, this docker image runs in standalone mode using default profile, but you can change this, overriding some environment variables.

In Docker, we use `-e` parameter to do this (override env variables), for example:

```
docker run -t -d -e "WILDFLY_HOME=/opt/wildfly" -p 8080:8080 -p 9990:9990 tozores\alpine-wildfly
```

See below the list of variables, available to change their values.

## Environment variables 

| Variable          |  Description                                                   | Default        |
|-------------------|----------------------------------------------------------------|:--------------:|
| WILDFLY_VERSION   | Define the version to be downloaded. This information is used also to define some temporary paths inside the container | 10.0.0.Final |  
| JDK_VERSION       | Define the OpenJDK version to be used. For now the OpenJDK is the only choice and the Alpine Linux only provides the versions 7 and 8 | 8 |
| WILDFLY_HOME      | Define the Wildfly installation directory | /opt/wildfly |
| DOWNLOAD_LOCATION | Define the location to download the Wildfly package, can be a URL or a path in the Docker host | http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz |
| WILDFLY_MODE      | Define the mode that Wildfly will run. For now only standalone mode is available. <br />Options: <br />**standalone:** Default/WEB profile, only Java EE Web specifications available, without clustering support <br /><br />**standalone-ha:** Default profile with clustering support. <br /><br />**standalone-full:** Full profile, Full Java EE specifications available, without clustering support <br /><br />**standalone-full-ha:** Full profile with clustering support | standalone |
| ADMIN_USER        | Define the administrator user for the console | admin |
| ADMIN_PASS	    | Define the administrator password for the console | wildfly |