#!/bin/bash
#TRINN 5, kjøres på alle servere

#manager 192.168.130.196
#docker2 192.168.129.102
#docker3 192.168.128.138

sudo mount -t glusterfs 192.168.130.196:/bf_config /bf_config
sudo mount -t glusterfs 192.168.130.196:/bf_images /bf_images
