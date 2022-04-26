#!/bin/bash

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

exit;

# Composer
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

sudo apt -y autoclean && sudo apt -y autoremove

echo ~
mkdir runner1
cd runner1
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.290.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.290.1/actions-runner-linux-x64-2.290.1.tar.gz
echo "2b97bd3f4639a5df6223d7ce728a611a4cbddea9622c1837967c83c86ebb2baa  actions-runner-linux-x64-2.290.1.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.290.1.tar.gz
