#!/bin/bash

echo 'Install requirements'

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y

phpVersions=('7.1', '7.2', '7.3', '7.4' '8.0' '8.1')
phpExtensions=('dev', 'cli', 'mbstring', 'curl', 'intl', 'mbstring', 'mcrypt', 'xml', 'xmlrpc', 'xsl', 'yaml', 'zip', 'imagick', 'gd', 'opcache', 'memcache', 'memcached', 'mysql', 'sqlite3')
phpPecls=('mongodb', 'redis', 'pcov', 'apcu')


for phpVersion in "${phpVersions[@]}"
do
  for phpExtension in "${phpExtensions[@]}"
  do
    sudo apt install php"${phpVersion}"-"${phpExtension}"
  done

  for phpPecl in "${phpPecls[@]}"
  do
    sudo pecl -d php_suffix="${phpVersion}" install "${phpPecl}"
    sudo pecl uninstall -r "${phpPecl}"
  done
done
