#!/bin/bash

# Update package lists
sudo apt-get update

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf