#!/bin/bash
#gruppe 25 / thegolddiggers
#Skal kjøres av .py script for backup 
#for å starte servere som ikke er online

declare -a serverIP=( "192.168.129.102" "192.168.128.138" "192.168.130.196" "192.168.131.94" "192.168.130.12" )
declare -a serverName=( "docker2" "dockerden3." "Manager" "Balancer" "db1" )

j=-1

for i in "${serverIP[@]}"
do

((j++))
echo -n "Details for $i: "
echo "servername: ${serverName[$j]}"
ping -w 1 $i


if [ $? -ne 0 ]; then
	source ~/IMT3003_V20_group25-openrc.sh
	openstack server start ${serverName[j]}

	#Venter i 5 min, slik at server rekker å
	#boote før .py script gjør selve backupen:

	sleep 300
fi

done


