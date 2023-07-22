#!/bin/bash

version='10.11'

sudo apt install -y curl apt-transport-https software-properties-common lsb-release ca-certificates gnupg2
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=${version}

sudo apt update && sudo apt upgrade -y
apt policy mariadb-server
sudo apt install -y mariadb-server mariadb-client
