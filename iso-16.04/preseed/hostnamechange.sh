#!/bin/bash

#############################
# Change Hostname  and Host # 
#############################
sed -i '/ubuntu/d' /etc/hosts

v1=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
v1=`echo "${v1//./-}"`
v2=CustomJavaFx-$v1
echo $v2 > /etc/hostname #change the hostname with ip suffix 
echo 127.0.1.1  $v2 >> /etc/hosts #add in new host name in etc host file 
