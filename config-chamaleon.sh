#!/bin/bash

# Update package lists
sudo apt-get update

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf
yes | sudo apt install docker.io
yes | sudo apt install qemu-kvm libvirt-daemon-system virtinst bridge-utils dnsmasq

# Docker config
sudo systemctl start docker
sudo systemctl enable docker

#VM config
wget http://releases.ubuntu.com/24.04/ubuntu-24.04.3-live-server-amd64.iso


sudo sed -i 's/#FirewallBackend=/FirewallBackend=iptables/' /etc/firewalld/firewalld.conf
sudo systemctl restart firewalld


cat <<EOF > ~/default.xml
<network>
  <name>default</name>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define ~/default.xml

sudo virsh net-autostart default

sudo virsh net-start default

virsh net-list --all