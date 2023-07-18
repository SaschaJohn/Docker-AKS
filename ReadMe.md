# Docker-AKS
![Contributors](https://img.shields.io/github/contributors/SaschaJohn/docker-aks?style=plastic)
![Forks](https://img.shields.io/github/forks/SaschaJohn/docker-aks)
![Stars](https://img.shields.io/github/stars/SaschaJohn/docker-aks)
![Licence](https://img.shields.io/github/license/SaschaJohn/docker-aks)
![Issues](https://img.shields.io/github/issues/SaschaJohn/docker-aks)

## Description
This repository contains the container definition for a strongswan ipsec pod based on debian:bullseye.

The image can be run either as client or router. The kubernetes folder contains the deployment description
for both pods. In addition there is a service deployment, that balances between the client and the router to keep
the router pod ip address static in the kubernetes environment.

The router pod offers two functionalities.
### IPSEC
It acts as strongswan ipsec client and connects to a remote ipsec endpoint.

To allow this, the files ipsec.secrets and swanctl.conf must be adjusted accordingly.

ipsec.secrets contains the remote public ip address and the pre shared key (PSK).

swanctl.conf contains the connection definition with the remote public ip address:
remote_addrs=20.73.9.96

The ipsec connection is established via the entrypoint.sh
The entrypoint must contain all remote ip address rangen routed via the ipsec connection.
So the line 
ip route add 192.168.0.0/24 dev az0 
may be adjusted and/or multiplied.

### Wireguard
Furthermore the router acts as wireguard server.
The necessary setup is specified in router.sh

The script also applies the configuration file for the wireguard interface.
This file needs to be adjusted to contain the public key of each peer.


### Client
The client acts as wireguard peer for the router pod. It contains a configuration file with a unique private key and references the wireguard server as peer.