#!/bin/bash

# Configure Interfaces
ifconfig eth1 up
ip addr add 10.0.1.1/24 dev eth1

# Configure Routing
ip route add 10.0.0.0/24 via 10.0.1.2

# Enable forwareding
sysctl -w net.ipv6.conf.all.forwarding=1