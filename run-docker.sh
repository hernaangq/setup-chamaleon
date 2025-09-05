#!/bin/bash
sudo docker build --no-cache -t container1 .
sudo docker run -it container1