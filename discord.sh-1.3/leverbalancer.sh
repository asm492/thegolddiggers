#!/bin/sh
#Sjekker om BALANCER lever
while true; do

if curl -s --head --request GET 192.168.131.94 | grep "200 OK" > /dev/null; then
:
else
./discord.sh --text "@everyone BALANCER svarer ikke!" | date  >> siteuptime.txt;

fi

sleep 120;

done;


