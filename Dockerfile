# Use the official Ubuntu 24.04 image as the base
FROM ubuntu:24.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y sysbench iperf git && \
    apt-get clean

# Clone the Git repository
RUN git clone https://github.com/hernaangq/setup-chameleon.git /setup-chameleon && \
    cd /setup-chameleon && \
    sudo chmod 777 *

# Set the working directory
WORKDIR /setup-chameleon

# Default command to keep the container running (can be overridden)
CMD ["/bin/bash"]