#!/bin/bash
#Dette scriptet kjøres kun på swarm manager!
#Steg 1: kjøre dette script
#Steg 2: Kjøre scriptet consul_swarm.sh på de andre serverne
#Manager: 192.168.130.196


#dig @192.168.128.5 bf.service.imt3003.consul. ANY
#dig @192.168.128.5 bf.servive.THEGOLDDIGGERS.consul ANY

#Starter consul server:
sudo docker run -d -v /opt/consul:/consul/data --name=consul --net=host -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' -e 'CONSUL_BIND_INTERFACE=ens3'  consul agent -server -bind=192.168.130.196 --datacenter=THEGOLDDIGGERS -client=0.0.0.0 -ui -bootstrap

#Kobler vårt datasenter til den sentrale consul tjenesten:
sudo docker run consul join -http-addr=192.168.130.196:8500 -wan 192.168.128.5 192.168.130.196

#Starte registrator:
sudo docker run -d --name=registrator --net=host --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest consul://localhost:8500
sudo docker run -d --name=consul_notifier -e CONSUL_ADDR=IP --net=host --volume=/var/run/docker.sock:/var/run/docker.sock docker.cs.hioa.no/kyrrepublic/swarm-consul-notifier:latest






