#!/bin/bash -ex
ip link add wg0 type wireguard
ip addr add 192.168.179.1/24 dev wg0
ip link set wg0 up
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -t nat -A POSTROUTING -o az0 -j MASQUERADE