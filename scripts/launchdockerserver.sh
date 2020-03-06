#!/bin/bash
#DETTE scriptet skal kun kjøres på docker workers!
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo docker swarm join --token SWMTKN-1-27hr8uptn2kc5e24lha7syhu8feo37d03efvc3oaq3poeitd7q-azqyx03fye19o958jnk2kd2e4 192.168.130.196:2377
sudo mkdir -p /etc/docker/certs.d/manager:5000
sudo cp ~/thegolddiggers/scripts/registry_certs/domain.cert /etc/docker/certs.d/manager:5000/ca.crt
sudo service docker restart
sudo docker pull manager:5000/bf:latest
