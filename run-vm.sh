#!/bin/bash

#VM config
wget http://releases.ubuntu.com/24.04/ubuntu-24.04.3-live-server-amd64.iso

sudo mv ~/setup-chamaleon/ubuntu-24.04.3-live-server-amd64.iso /var/lib/libvirt/images/

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

sudo virsh net-list --all

sudo virt-install \
  --name ubuntu24 \
  --ram 4096 \
  --vcpus 2 \
  --disk size=20 \
  --cdrom /var/lib/libvirt/images/ubuntu-24.04.3-live-server-amd64.iso \
  --os-variant ubuntu24.04 \
  --network network=default \
  --graphics vnc,listen=0.0.0.0