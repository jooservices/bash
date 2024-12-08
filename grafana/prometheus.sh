#!/bin/bash

echo 'Create tmp dir'
mkdir -p /tmp/prometheus

echo 'Change directory'
cd /tmp/prometheus

echo 'Download Prometheus'
PROMETHEUS_VERSION=$(curl -Ls https://api.github.com/repos/prometheus/prometheus/releases/latest | jq ".tag_name" | xargs | cut -c2-)
wget "https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz"
tar xvzf prometheus-${VERSION}.linux-amd64.tar.gz
cd ./prometheus-${VERSION}.linux-amd64

echo 'Create directories'
for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done
sudo mkdir /var/lib/prometheus

echo 'Create user & group'
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --no-create-home --system -g prometheus prometheus

echo 'Deploy'
sudo mv prometheus promtool /usr/local/bin/
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
sudo mv consoles/ console_libraries/ /etc/prometheus/

echo 'Chown'
sudo chown -R prometheus:prometheus /usr/local/bin/prometheus
sudo chown -R prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus

echo 'Create service'
sudo tee /etc/systemd/system/prometheus.service<<EOF
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP \$MAINPID
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.console.templates=/etc/prometheus/consoles \
  --web.console.libraries=/etc/prometheus/console_libraries \
  --web.listen-address=0.0.0.0:9090 \
  --web.external-url=

SyslogIdentifier=prometheus
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
