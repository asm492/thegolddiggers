#!/bin/bash

#Sjekker om alt funker på manager
echo "==========sudo docker logs consul============"
sudo docker logs consul

echo "==========netstat -anltp====================="
netstat -anltp

echo "==========sudo docker logs registrator======="
sudo docker logs registrator

echo "==========docker logs consul_notifier========"
sudo docker logs consul_notifier

echo "===================DIG======================="
dig @192.168.128.5 bf.service..consul. ANY


