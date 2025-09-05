#!/bin/bash

# Update package lists
sudo apt-get update

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf
yes | sudo apt install docker.io


# Git files 
git clone https://github.com/hernaangq/setup-chamaleon.git
cd setup-chamaleon
sudo chmod 777 *

# Docker config
sudo systemctl start docker
sudo systemctl enable docker