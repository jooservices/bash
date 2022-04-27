#!/bin/bash

echo 'Setup for Raspberry Pi 4 with PHP 8.0'

sudo apt update && sudo apt upgrade -y
sudo apt -y install git 
cd ~
# Docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker ${USER}
newgrp docker

# PHP
sudo apt -y install software-properties-common
sudo apt-get -y install apt-transport-https lsb-release ca-certificates curl
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update && sudo apt upgrade -y

sudo apt install -y php8.0-dev
sudo apt install -y php-dev
sudo apt -y install php8.0-cli php8.0-curl php8.0-igbinary php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-xml php8.0-xmlrpc php8.0-xsl php8.0-yaml php8.0-zip
sudo apt -y install php8.0-gd php8.0-imagick imagemagick
sudo apt -y install php8.0-opcache php8.0-memcache php8.0-memcached php8.0-apcu
sudo apt -y install php8.0-mysql php8.0-sqlite3

# Set PHP 8.0
sudo update-alternatives --set php /usr/bin/php8.0
sudo update-alternatives --set php-config /usr/bin/php-config8.0
sudo update-alternatives --set phpize /usr/bin/phpize8.0

# Composer
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

sudo apt -y autoclean && sudo apt -y autoremove

# SSH
ssh-keygen -t rsa -b 4096 -C "jooservices@gmail.com" -f ~/.ssh/id_rsa -N ''

# Github

cd ~
mkdir runner1
cd runner1
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-arm64-2.290.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.290.1/actions-runner-linux-arm64-2.290.1.tar.gz
echo "640596ec55df33efe1fff086e1379c1108cba6656791807708cdb664de51fb01  actions-runner-linux-arm64-2.290.1.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-arm64-2.290.1.tar.gz
