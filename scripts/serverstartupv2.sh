#!/bin/bash
while true; do
cd ~
source IMT3003_V20_group25-openrc.sh


echo "Hello world" >> dennefilakanslettes.txt
openstack server start db1
openstack server start www1
openstack server start www2
openstack server start Balancer
openstack server start dockerserver


sleep 300;
done;
