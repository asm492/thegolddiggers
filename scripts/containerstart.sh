#!/bin/bash
#Kjøres fra crontab -e: @reboot /home/ubuntu/containerstart.sh
sudo docker stop $(sudo docker ps -a -q)
sudo docker container rm www10 www9

sudo docker run -d --restart=on-failure:3 --name=www9 -p 8009:80 bf:v1
sudo docker run -d --restart=on-failure:3 --name=www10 -p 8010:80 bf:v1

/home/ubuntu/discord.sh-1.3/./discord.sh --text "I just restarted, make sure my containers are running"
date >> restartdates.txt
