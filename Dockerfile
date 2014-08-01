FROM debian:wheezy
MAINTAINER Jean-Christophe Saad-Dupuy <jc.saaddupuy@fsfe.org>

ENV DEBIAN_FRONTEND noninteractive

## Base packages
RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python2.7 python-pip
######

## Radicale installation
RUN pip install radicale
######

# Fix empty $HOME
# Adds a custom non root user with home directory
RUN useradd -d /home/radicale -m radicale 

# Create some folder
RUN mkdir -p /data/radicale
######

 
EXPOSE 5232

ENV HOME /home/radicale
USER radicale
WORKDIR /home/radicale
CMD ["radicale"]
