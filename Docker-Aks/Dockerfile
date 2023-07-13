FROM debian:bullseye
RUN apt update
RUN apt-get install -y iproute2 strongswan charon-systemd vim
COPY swanctl.conf /etc/swanctl/swanctl.conf
COPY ipsec.secrets /etc/ipsec.secrets
RUN apt-get install -y ssh tcpdump iputils-ping
RUN apt-get install -y wireguard iptables

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ADD client.sh /
RUN chmod +x /client.sh
ADD router.sh /
RUN chmod +x /router.sh

ADD client-wg0.conf /
ADD router-wg0.conf /

CMD ["/entrypoint.sh"]
#docker build -t darkmessiah/swan:0.0.10 .
#docker push darkmessiah/swan:0.0.10


