FROM debian:jessie
MAINTAINER Ohge <https://github.com/Ohge>

### INSTALL DEPENDENCIES
RUN set -xe &&\
    apt-get update &&\
    apt-get install -y python git-core &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt &&\
    git clone https://github.com/rembo10/headphones.git

### CREATE PERSISTENT VOLUMES
VOLUME ["/etc/headphones"]
VOLUME ["/downloads"]
VOLUME ["/fetch"]

### EXPOSE PORTS
EXPOSE 8181

### RUN SCRIPT
CMD ["/bin/bash", "/etc/headphones/.headphones"]
