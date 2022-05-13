#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install curl apt-transport-https software-properties-common lsb-release ca-certificates gnupg2
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.7
