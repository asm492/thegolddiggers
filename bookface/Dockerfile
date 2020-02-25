FROM ubuntu:18.04
MAINTAINER avleensm@stud.ntnu.no
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&  apt-get install -y apache2 libapache2-mod-php php-mysql git php-memcache curl php-cli php-mbstring unzip php-pgsql glusterfs-client
RUN apt-get install -y git
RUN git clone https://github.com/asm492/thegolddiggers.git
#WORKDIR ~/thegolddiggers/bookface
#RUN mkdir /var/www/html/
#WORKDIR /var/www/html/
RUN rm /var/www/html/index.html
WORKDIR thegolddiggers/bookface
RUN cp code/* /var/www/html/
RUN cp config.php /var/www/html/
#RUN mkdir /var/www/html/
#images
#ADD ./code/* /var/www/html/
#ADD ./config.php /var/www/html/config.php
#ADD init.sh /
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND", "-k", "start"]
#CMD apachectl -D FOREGROUND
