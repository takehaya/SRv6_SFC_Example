#!/bin/bash

# Configure Interfaces
# ifconfig eth1 up
# ip addr add 10.0.0.1/24 dev eth1

ifconfig eth1 up
ip addr add 10.0.0.1/24 dev eth1

# Configure Routing
ip route add 10.0.0.0/24 via 10.0.0.1
# ip route add 0.0.0.0/0 via 10.0.0.2 
# Enable forwarding
sysctl -w net.ipv6.conf.all.forwarding=1