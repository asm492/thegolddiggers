#!/bin/bash
#Dette scriptet kjøres kun på swarm, ikke på manager!
#Manager: 192.168.130.196

#Først starter vi en consul agent:
sudo docker run -d -v /opt/consul:/consul/data --name=consul --net=host -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' -e 'CONSUL_BIND_INTERFACE=ens3' consul agent -join=192.168.130.196 --datacenter=THEGOLDDIGGERS -client=0.0.0.0
#instans av registrator, for å fange opp containere som kjører her, men som ikke er del av en tjeneste:
sudo docker run -d --name=registrator --net=host --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest consul://$(ifconfig ens3 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}' ):8500





