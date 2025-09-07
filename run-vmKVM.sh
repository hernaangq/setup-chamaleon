#!/bin/bash

#VM config

wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-nocloud-amd64.qcow2

sudo mv debian-12-nocloud-amd64.qcow2 /var/lib/libvirt/images/vm-test1.qcow2

sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/vm-test1.qcow2

 sudo chmod 660 /var/lib/libvirt/images/vm-test1.qcow2

 sudo kvm -m 4096 -smp 2 -hda /var/lib/libvirt/images/vm-test1.qcow2 -boot c -nographic


 # log with root and no password