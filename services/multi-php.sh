#!/bin/bash

echo 'Install requirements'

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

phpVersions=('7.2' '7.3' '7.4' '8.0' '8.1')
phpExtensions=('dev' 'cli' 'mbstring' 'curl' 'intl' 'mbstring' 'mcrypt' 'xml' 'xmlrpc' 'xsl' 'yaml' 'zip' 'imagick' 'gd' 'opcache' 'memcache' 'memcached' 'mysql' 'sqlite3' 'ldap')
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
  done
done

echo 'Install composer'
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
