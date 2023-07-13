# deploy all files in folder
k apply -f . 

# step into container
kubectl exec --stdin --tty ubuntu -- /bin/bash

apt update
apt install ssh tcpdump
charon-systemd &
swanctl --load-all
swanctl -i -c azure
ip link add az0 type xfrm dev eth0 if_id 55
ip link set az0 up
ip route add 192.168.0.0/24 dev az0
sysctl -w net.ipv4.ip_forward=1
