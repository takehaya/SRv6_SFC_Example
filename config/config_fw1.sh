#!/bin/bash
# Configure Interfaces
# ifconfig eth1 up
# ip -6 addr add 2001:35::2/64 dev eth1

ifconfig lo up
ip -6 addr add fc00:5::5/64 dev lo

# Enable forwarding 
sysctl -w net.ipv6.conf.all.forwarding=1
sysctl -w net.ipv4.conf.all.forwarding=1

# Accept SRv6 traffic
sysctl -w net.ipv6.conf.all.seg6_enabled=1
sysctl -w net.ipv6.conf.lo.seg6_enabled=1
sysctl -w net.ipv6.conf.eth1.seg6_enabled=1

# Enable SR Aware IPtables
sysctl -w net.ipv4.conf.all.rp_filter=0
sysctl -w net.ipv4.conf.eth1.rp_filter=0
sysctl -w net.ipv4.conf.eth2.rp_filter=0


# Configure Routing
sudo ip -6 route add default via 2001:35::1
wget https://gist.githubusercontent.com/takehaya/ad610262ebe2842ef33d9186e6430671/raw/f4f3a6fd69eebf32f3ed181077a7416b9aaa3437/deploy-vnf-v4.sh

sh deploy-vnf-v4.sh add snort veth0 veth1 192.168.1.1/24 192.168.2.1/24 192.168.1.2/24 192.168.2.2/24

# Install Snort
cd ~/
wget https://snort.org/downloads/snort/daq-2.0.6.tar.gz
wget https://snort.org/downloads/snort/snort-2.9.12.tar.gz

tar xvzf daq-2.0.6.tar.gz
cd daq-2.0.6
sudo apt-get install -y libpcap-dev

./configure && make && sudo make install

cd ~/
tar xvzf snort-2.9.12.tar.gz
cd snort-2.9.12

sudo apt-get install -y libpcre3 libpcre3-dev libdumbnet-dev

./configure --enable-sourcefire --disable-open-appid && make && sudo make install

# Update shared libraries (mandatory according to Snort documentation)
sudo ldconfig

# Configure snort rules
sudo mkdir -p /etc/snort/ /etc/snort/rules/ /var/log/snort
sudo touch /etc/snort/snort.conf /etc/snort/rules/local.rule
sudo -- sh -c "echo 'var RULE_PATH rules' >> /etc/snort/snort.conf"
sudo -- sh -c "echo 'include \$RULE_PATH/local.rule' >> /etc/snort/snort.conf"
sudo -- sh -c "echo 'alert icmp any any -> any any (msg:\"ICMP detected\"; sid:1000)' >> /etc/snort/rules/local.rule"


# Configure SRv6 Policy 
# is_answer_2
# depmod -a && modprobe srext
# sudo srconf localsid add fc00:5::bb end.ad4 ip 192.168.1.2 veth0 veth1

