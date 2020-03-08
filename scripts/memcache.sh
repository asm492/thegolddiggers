#!/bin/bash
sudo docker run -d --restart always --name=memcache -p 11211:11211 -d memcached memcached -m 4096
