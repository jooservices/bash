#!/bin/bash

sudo apt update && sudo apt upgrade -y
 
cd ~
# Docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
 sudo apt-get update
 sudo apt-get -y install docker-ce docker-ce-cli containerd.io
 sudo groupadd docker
 sudo usermod -aG docker $USER
 newgrp docker

# PHP
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

sudo apt install -y php-dev
sudo apt -y install php-cli php-mbstring php-pecl-http \
  php8.1-cli php8.1-curl php8.1-dev php8.1-igbinary php8.1-intl php8.1-mbstring php8.1-mcrypt php8.1-xml php8.1-xmlrpc php8.1-xsl php8.1-yaml php8.1-zip
sudo apt -y install php-imagick php-gd php8.1-gd php8.1-imagick imagemagick
sudo apt -y install php8.1-opcache php8.1-memcache php8.1-memcached php8.1-apcu
sudo apt -y install php8.1-mysql php8.1-sqlite3

echo '' | sudo pecl install mongodb
echo '' | sudo pecl install redis
echo '' | sudo pecl install pcov

sudo su
sudo echo 'extension=mongodb.so' >> /etc/php/8.1/cli/php.ini
sudo echo 'extension=redis.so' >> /etc/php/8.1/cli/php.ini
sudo echo 'extension=pcov.so' >> /etc/php/8.1/cli/php.ini

# Composer
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
