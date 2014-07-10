FROM ubuntu
MAINTAINER matt@aetherical.com

RUN apt-get update;apt-get upgrade -y
RUN apt-get install -y apache2
RUN a2enmod proxy_http
RUN a2enmod cache_disk
RUN a2enmod proxy_connect
RUN a2enmod ssl
RUN rm /etc/apache2/mods-enabled/cache_disk.conf
RUN a2dissite 000-default
RUN mkdir -p /var/run/apache2
RUN mkdir -p /var/lock/apache2
RUN mkdir -p /var/log/apache2
ADD ./proxy_host.conf /etc/apache2/sites-enabled/
ADD ./runme /
RUN chmod 755 /runme

VOLUME ["/cache"]

EXPOSE 8080

CMD ["/bin/bash","/runme"]
 
