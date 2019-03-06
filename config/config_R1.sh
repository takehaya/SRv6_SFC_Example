#!/bin/bash

# Configure Interfaces
# ifconfig eth1 up
# ip addr add 10.0.0.2/24 dev eth1

# ifconfig eth2 up
# ip -6 addr add 2001:12::1/64 dev eth2

ifconfig lo up
ip -6 addr add fc00:1::1/64 dev lo

# Enable forwarding
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.forwarding=1

# Accept SRv6 traffic
sysctl -w net.ipv6.conf.all.seg6_enabled=1
sysctl -w net.ipv6.conf.lo.seg6_enabled=1
sysctl -w net.ipv6.conf.eth1.seg6_enabled=1
sysctl -w net.ipv6.conf.eth2.seg6_enabled=1
sysctl -w net.ipv4.conf.all.rp_filter=0

# Configure Routing
ip -6 route add ::/0 via 2001:12::2

sudo ip -6 route add fc00:4::/64 via 2001:34::2  
sudo ip -6 route add fc00:5::/64 via 2001:35::2 

# Configure SR policies

# default config
ip route add 10.0.1.0/24 encap seg6 mode encap segs fc00:3::bb,fc00:4::bb dev eth1
ip -6 route add fc00:1::bb/128 encap seg6local action End.DX4 nh4 10.0.0.1 dev eth2

# # is answer1 config
# ip route add 10.0.1.0/24 encap seg6 mode encap segs fc00:3::bb,fc00:5::bb,fc00:4::bb dev eth1
# ip -6 route add fc00:1::bb/128 encap seg6local action End.DX4 nh4 10.0.0.1 dev eth2
