#!/bin/bash
#Kjøres fra crontab -e: @reboot /home/ubuntu/containerstart.sh
sudo docker stop $(sudo docker ps -a -q)
sudo docker container rm www11 www10 www9

sudo docker run -d --restart always --name=www9 -p 8009:80 bookface:v1
sudo docker run -d --restart always --name=www10 -p 8010:80 bookface:v1
sudo docker run -d --restart always --name=www11 -p 8011:80 bookface:v1
#/home/ubuntu/discord.sh-1.3/./discord.sh --text "I just restarted, make sure my containers are running"

