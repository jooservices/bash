#!/bin/bash

sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp on

echo 'Install requirements'

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

phpVersions=('8.3')
phpExtensions=('dev' 'cli' 'mbstring' 'curl' 'intl' 'mbstring' 'xml' 'xmlrpc' 'xsl' 'yaml' 'zip' 'imagick' 'gd' 'opcache' 'memcache' 'memcached' 'mysql' 'sqlite3' 'ldap' 'bcmath' 'fpm')
phpPecls=('mongodb' 'redis' 'pcov' 'apcu')

for phpVersion in "${phpVersions[@]}"
do
  echo "Install PHP ${phpVersion} extensions"
  extensions=$(printf "php${phpVersion}-%s " "${phpExtensions[@]}")
  sudo apt install -y $extensions

  echo "Install PHP ${phpVersion} pecl extensions"
  for phpPecl in "${phpPecls[@]}"
  do
    sudo pecl -d php_suffix="${phpVersion}" install "${phpPecl}"
    sudo pecl uninstall -r "${phpPecl}"    
    sudo bash -c 'echo "extension='${phpPecl}'.so" >> /etc/php/'${phpVersion}'/cli/php.ini'
    sudo bash -c 'echo "extension='${phpPecl}'.so" >> /etc/php/'${phpVersion}'/fpm/php.ini'
  done
done

cd /home/joos/
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

cd /home/joos/
git clone https://github.com/jooservices/XCrawler.git
cd /home/joos/XCrawler
composer install

sudo apt install supervisor -y
