#!/bin/bash

echo 'Install docker'
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -sSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

docker run hello-world
