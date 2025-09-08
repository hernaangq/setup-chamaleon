#!/bin/bash

# Update package lists
sudo apt-get update

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf
yes | sudo apt install docker.io
yes | sudo apt install qemu-kvm libvirt-daemon-system virtinst bridge-utils dnsmasq ufw procps

# Docker config
sudo systemctl start docker
sudo systemctl enable docker

