#!/bin/bash


printf "\n\n\n\n"

echo "Sjekker om alt funker pa manager (Uke 15)"
printf "\n\n"
echo "==========sudo docker logs consul============"
sudo docker logs consul

echo "==========netstat -anltp====================="
netstat -anltp | grep 8500

echo "==========sudo docker logs registrator======="
sudo docker logs registrator

echo "==========docker logs consul_notifier========"
sudo docker logs consul_notifier

echo "===================DIG======================="
dig @192.168.128.5 bf.service..consul. ANY

printf "\n\n"

