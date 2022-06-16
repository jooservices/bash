#!/bin/bash

echo 'Install docker'
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker ${USER}
newgrp docker
