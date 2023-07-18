#!/bin/bash -ex
ip link add az0 type xfrm dev eth0 if_id 55 #create a xfrm device with id 55 to use for the ipsec connection
ip link set az0 up #set the ne interface up
ip route add 192.168.0.0/24 dev az0 #add a route to the remote network ip address range via the xfrm interface
sysctl -w net.ipv4.ip_forward=1 #enable ip forwarding for router pod
charon-systemd & #start ipsec daemon in background
/bin/sleep 3s #wait until started
swanctl --load-all #load all connections
swanctl -i -c azure #instanciate conncection named azure
#/bin/sleep 3650d