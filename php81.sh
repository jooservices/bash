#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt -y install git 
cd ~

# PHP
sudo apt install software-properties-common
# Will not work on Pi 4
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

sudo apt install -y php-dev
sudo apt -y install php-cli php-mbstring \
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
