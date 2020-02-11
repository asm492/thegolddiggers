#!/bin/sh
#Dette scriptet skal kjøres på balancer, sjekker om manager lever.
#Installert Apache på manager for kunne curle
#NB! DETTE SCRIPTET MÅ LIGGE I SAMME MAPPE SOM DISCORD BOT (discord.sh) og .webhook
#KJØR MED <<nohup ./startserverv2.sh& >>
# SCRIPT forutsetter at IMT3003...sh ligger i ~ og at discord.sh ligger i ~/discord.sh-1.3
while true; do




#cd ~
#source IMT3003_V20_group25-openrc.sh
#manager
if curl -s --head --request GET 192.168.128.18  | grep "200 OK" > /dev/null; then
:
else
cd ~
source IMT3003_V20_group25-openrc.sh
openstack server start dockerserver > /dev/null
cd ~/discord.sh-1.3
./discord.sh --text "@everyone Neineinei helvette faen! MANAGER svarer ikke! FAEN NÅ STIKKER JEG PÅ BUTIKKEN OG KJØPER PETTERØES 3 OG RØD RIZLA. HVIS SERVEREN IKKE ER OPPE OG GÅR INNEN JEG KOMMER TILBAKE DABBER JEG PÅ DEN" | date >> manageruptime.txt;
fi





sleep 300;

done;


