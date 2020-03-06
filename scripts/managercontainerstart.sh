#!/bin/bash
#Kjøres fra crontab -e: @reboot /home/ubuntu/containerstart.sh
sudo docker stop $(sudo docker ps -a -q)
sudo docker container rm M1-C3 M1-C4 M1-C5 M1-C6 M1-C6 M1-C7 M1-C8

sudo docker run -d --restart always --name=M1-C3 -p 8003:80 manager:5000/bf:latest
sudo docker run -d --restart always --name=M1-C4 -p 8004:80 manager:5000/bf:latest
sudo docker run -d --restart always --name=M1-C5 -p 8005:80 manager:5000/bf:latest
sudo docker run -d --restart always --name=M1-C6 -p 8006:80 manager:5000/bf:latest
sudo docker run -d --restart always --name=M1-C7 -p 8007:80 manager:5000/bf:latest
sudo docker run -d --restart always --name=M1-C8 -p 8008:80 manager:5000/bf:latest
