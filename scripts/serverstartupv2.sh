#!/bin/bash

source ./IMT3003_V20_group25_service.sh

openstack server start db1
openstack server start www1
openstack server start www2
openstack server start Balancer
openstack server start dockerserver
