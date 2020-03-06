#!/bin/bash
#Kjøres fra crontab -e: @reboot /home/ubuntu/containerstart.sh
sudo docker stop $(sudo docker ps -a -q)
sudo docker container rm www3 www4 www5 www6 www7 www8

sudo docker run -d --restart always --name=www3 -p 8003:80 bookface:v1
sudo docker run -d --restart always --name=www4 -p 8004:80 bookface:v1
sudo docker run -d --restart always --name=www5 -p 8005:80 bookface:v1
sudo docker run -d --restart always --name=www6 -p 8006:80 bookface:v1
sudo docker run -d --restart always --name=www7 -p 8007:80 bookface:v1
sudo docker run -d --restart always --name=www8 -p 8008:80 bookface:v1
