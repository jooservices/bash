#!/bin/bash

echo 'Install requirements'

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

phpVersions=('7.4' '8.0' '8.1' '8.2' '8.3')
phpExtensions=('dev' 'cli' 'mbstring' 'curl' 'intl' 'mbstring' 'mcrypt' 'xml' 'xmlrpc' 'xsl' 'yaml' 'zip' 'imagick' 'gd' 'opcache' 'memcache' 'memcached' 'mysql' 'sqlite3' 'ldap' 'bcmath' 'fpm')
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
