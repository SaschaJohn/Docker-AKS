#!/bin/bash -ex
ip link add wg0 type wireguard
ip addr add 192.168.179.2/24 dev wg0
ip link set wg0 up
ip route add 192.168.0.0/24 dev wg0
wg setconf wg0 /client-wg0.conf #apply client-wg0.conf to interface wg0