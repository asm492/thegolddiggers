#!/bin/bash

03 * * * * openstack server start db1
03 * * * * openstack server start www1
03 * * * * openstack server start www2
03 * * * * openstack server start balancer
03 * * * * openstack server start dockerserver