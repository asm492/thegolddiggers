#!/bin/bash
#Kjøres fra crontab -e: @reboot /home/ubuntu/containerstart.sh
sudo docker stop $(sudo docker ps -a -q)
sudo docker container rm memcache

#sudo docker run -d --restart always --name=www9 -p 8009:80 bookface:v1
#sudo docker run -d --restart always --name=www10 -p 8010:80 bookface:v1
#sudo docker run -d --restart always --name=www11 -p 8011:80 bookface:v1
#sudo docker run -d --restart always --name=memcache -p 11211:11211 -d memcached memcached -m 256
