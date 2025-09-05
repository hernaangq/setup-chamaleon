#!/bin/bash

# Update package lists
sudo apt-get update

# Install sysbench and iperf with automatic 'yes' to prompts
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf