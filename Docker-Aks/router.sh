#!/bin/bash -ex
ip link add wg0 type wireguard #add wireguard interface
ip addr add 192.168.179.1/24 dev wg0 #assign static ip for overlay network to the new interface
ip link set wg0 up #set new interface up
iptables -A FORWARD -i wg0 -j ACCEPT #enable ip forwarding on the wireguard interface
iptables -t nat -A POSTROUTING -o az0 -j MASQUERADE #enable NAT for private ip adresses
wg setconf wg0 /router-wg0.conf #apply router-wg0.conf to interface wg0