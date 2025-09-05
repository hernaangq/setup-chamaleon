#!/bin/bash
sudo docker build --no-cache -t container1 .
sudo docker run -it container1

# Installations
yes | sudo apt-get install sysbench
yes | sudo apt-get install iperf