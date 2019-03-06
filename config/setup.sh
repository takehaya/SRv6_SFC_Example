#/bin/sh

# install dependencies for building iproute2
# apt update
# DEBIAN_FRONTEND=noninteractive apt upgrade -y
apt-get install -y linux-headers-4.15.0-38 linux-headers-4.15.0-38-generic linux-image-4.15.0-38-generic linux-modules-4.15.0-38-generic linux-modules-extra-4.15.0-38-generic

# most update type
# linux-headers-4.18.0-13  linux-headers-4.18.0-13-generic linux-headers-generic-hwe-18.04 
# linux-image-4.18.0-13-generic linux-image-generic-hwe-18.04 linux-modules-4.18.0-13-generic linux-modules-extra-4.18.0-13-generic thermald   
# sudo apt install linux-generic-hwe-18.04 

apt install -y bison flex


# clone latest iproute2
# git clone https://github.com/segment-routing/iproute2.git /tmp/iproute2
# cd /tmp/iproute2

# sed -i /ARPD/d Makefile
# sed -i 's/arpd.8//' man/man8/Makefile
# rm -v doc/arpd.sgml
# sed -i 's/m_ipt.o//' tc/Makefile

cd /tmp
wget https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.20.0.tar.gz
tar -xzvf ./iproute2-4.20.0.tar.gz
cd ./iproute2-4.20.0

make && make install

cd /tmp
git clone https://github.com/netgroup/SRv6-net-prog 
cd srv6-net-prog/srext/
sudo make && sudo make install

# usage
# sudo depmod -a
# sudo modprobe srext