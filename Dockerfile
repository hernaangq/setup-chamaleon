# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the setup-chamaleon repository from GitHub
RUN git clone https://github.com/hernaangq/setup-chamaleon.git /setup-chamaleon

# Set working directory
WORKDIR /setup-chamaleon

RUN chmod 777 * 

# Optional: Display contents of the directory
CMD ["/bin/bash"]