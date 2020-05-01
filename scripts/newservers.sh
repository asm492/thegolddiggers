#!/bin/bash

source ~/IMT3003_V20_group25-openrc.sh
declare -a arr=$(openstack server list | awk ' FNR !=2 { print $4}' )

for i in "${arr[@]}"
do
	#sjekker om string ikke er tom, trenger ikke backup av balancer og db1
	if [ -z ${arr[$i]} ] && [ ${arr[$i]} != "Balancer" ] && [ ${arr[$i]} != "db1" ]
	then
		echo "${arr[$i]}:/home/ubuntu/backup" >> ~/backup-policy.conf
	fi
done
