#!/bin/bash

echo 'Create tmp dir'
mkdir -p /tmp/prometheus

echo 'Change directory'
cd /tmp/prometheus

echo 'Download Prometheus'
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar xzvf prometheus-2.46.0.linux-amd64.tar.gz

cd ./prometheus-2.46.0.linux-amd64

echo 'Create directories'
for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done
sudo mkdir /var/lib/prometheus

echo 'Create user & group'
groupadd prometheus
useradd -s /sbin/nologin --system -g prometheus prometheus

echo 'Deploy'
sudo mv prometheus promtool /usr/local/bin/
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
sudo mv consoles/ console_libraries/ /etc/prometheus/

echo 'Chown'
sudo chown -R prometheus:prometheus /usr/local/bin/prometheus
sudo chown -R prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
