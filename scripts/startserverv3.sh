#!/bin/sh
#Sjekker om BALANCER, www1 og 2, balancer lever. NB SJEKKER IKKE DB1 og MANAGER DA DE IKKE KJORER APACHE
#NB! DETTE SCRIPTET MÅ LIGGE I SAMME MAPPE SOM DISCORD BOT (discord.sh) og .webhook
#KJØR MED << ./startserverv2.sh& >>
# SCRIPT forutsetter at IMT3003...sh ligger i ~ og at discord.sh ligger i ~/discord.sh-1.3
while true; do



cd ~
source IMT3003_V20_group25-openrc.sh
#balancer
if curl -s --head --request GET 10.212.140.71  | grep "200 OK" > /dev/null; then
:
else
cd ~
source IMT3003_V20_group25-openrc.sh
openstack server start Balancer >> restartdates.txt 
cd ~/discord.sh-1.3
./discord.sh --text "@everyone BALANCER issa old and ugly and dead, and his mom don't love him no more. ISSA i restart for you" | date >> manageruptime.txt;
fi


cd ~
source IMT3003_V20_group25-openrc.sh
openstack server start db1 > /dev/null

cd ~
source IMT3003_V20_group25-openrc.sh
#dockerserver
if curl -s --head --request GET 192.168.129.247 | grep "200 OK" > /dev/null; then
:
else
cd ~
source IMT3003_V20_group25-openrc.sh
openstack server start dockerden3. >> restartdates.txt
cd ~/discord.sh-1.3
./discord.sh --text "@everyone DOCKERSERVER issa no respond, issa i restart for u" | date >> manageruptime.txt;
fi





sleep 300;

done;


