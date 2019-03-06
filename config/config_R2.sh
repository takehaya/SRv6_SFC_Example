#!/bin/bash

# Configure Interfaces
# ifconfig eth1 up
# ip -6 addr add 2001:12::2/64 dev eth1

# ifconfig eth2 up
# ip -6 addr add 2001:23::1/64 dev eth2

# ifconfig eth3 up
# ip -6 addr add 2001:24::1/64 dev eth3

ifconfig lo up
ip -6 addr add fc00:2::2/64 dev lo

# Enable forwarding
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.forwarding=1

# Accept SRv6 traffic
sysctl -w net.ipv6.conf.all.seg6_enabled=1
sysctl -w net.ipv6.conf.lo.seg6_enabled=1
sysctl -w net.ipv6.conf.eth1.seg6_enabled=1
sysctl -w net.ipv6.conf.eth2.seg6_enabled=1
sysctl -w net.ipv6.conf.eth3.seg6_enabled=1

# Configure Routing
ip -6 route add fc00:1::/64 via 2001:12::1
ip -6 route add fc00:3::/64 via 2001:23::2
ip -6 route add fc00:4::/64 via 2001:24::2
