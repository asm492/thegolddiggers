#!/bin/sh
#Sjekker om BALANCER, www1 og 2, balancer lever. NB SJEKKER IKKE DB1 og MANAGER DA DE IKKE KJORER APACHE
#NB! DETTE SCRIPTET MÅ LIGGE I SAMME MAPPE SOM DISCORD BOT (discord.sh) og .webhook
#KJØR MED << ./startserverv2.sh& >>
# SCRIPT forutsetter at IMT3003...sh ligger i ~ og at discord.sh ligger i ~/discord.sh-1.3
while true; do


cd ~
source IMT3003_V20_group25-openrc.sh
openstack server start db1 > /dev/null
openstack server start dockerden3. > /dev/null
openstack server start Balancer > /dev/null
openstack server start backup > /dev/null



sleep 300;

done;


