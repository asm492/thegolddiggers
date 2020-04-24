#!/bin/bash
wget https://binaries.cockroachdb.com/cockroach-v19.2.2.linux-amd64.tgz
tar xzf cockroach-v19.2.2.linux-amd64.tgz 
sudo cp cockroach-v19.2.2.linux-amd64/cockroach /usr/local/bin 
sudo mkdir /bfdata
sudo cockroach start --insecure --store=/bfdata --listen-addr=0.0.0.0:26257 --http-addr=0.0.0.0:8080 --background --join=192.168.130.196:26257,192.168.129.102:26257,192.168.128.138:26257 --advertise-addr=192.168.130.196:26257
