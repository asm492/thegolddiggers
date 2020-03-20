#!/bin/bash
#SKAL KUN KJØRES PÅ MANAGER
#manager 192.168.130.196
#docker2 192.168.129.102
#docker3 192.168.128.138


echo "$0 begynner nå"
#dockerserver2 aka docker2
sudo gluster peer probe 192.168.129.102

#dokcerserver aka dockerden3
sudo gluster peer probe 192.168.128.138

sudo gluster volume create bf_images replica 3 192.168.130.196:/bf_brick 192.168.129.102:/bf_brick 192.168.128.138:/bf_brick force
sudo gluster volume start bf_images
sudo gluster volume create bf_config replica 3 192.168.130.196:/config_brick 192.168.129.102:/config_brick 192.168.128.138:/config_brick force
sudo gluster volume start bf_config
echo "$0 er ferdig!"
