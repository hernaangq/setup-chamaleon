#!/bin/bash

# Update package lists
sudo apt-get update

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf
yes | sudo apt install docker.io
yes | sudo apt install qemu-kvm libvirt-daemon-system virtinst bridge-utils dnsmasq


# Git files 
git clone https://github.com/hernaangq/setup-chamaleon.git
cd setup-chamaleon
sudo chmod 777 *

# Docker config
sudo systemctl start docker
sudo systemctl enable docker

#VM config
wget http://releases.ubuntu.com/24.04/ubuntu-24.04.3-live-server-amd64.iso
