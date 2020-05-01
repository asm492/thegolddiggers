#!/bin/bash

source ~/IMT3003_V20_group25-openrc.sh
antallServere=$(openstack server list | awk ' FNR !=2 { print $4}' | wc -l)
#Trekker bort 3 rader fra utskriften som brukes til formattering
antallServere=$(( $antallServere - 3 ))
echo $antallServere


declare -a arr=$(openstack server list | awk ' FNR !=2 { print $4}' )

for i in "${arr[@]}"
do
	if [ ${arr[$i]} != "Balancer" ] && [ ${arr[$i]} != "db1" ]
	then
		echo ${arr[$i]} >> back
	fi
echo ${arr[$i]} >> 
done
