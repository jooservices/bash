#!/bin/bash

source ./functions/functions.sh

source ./common/common-functions.sh

get_os_codename
# Show system information
show_system_info

# Main script execution starts here
execute_script "Do you want to set up passwordless sudo for the current user" "./common/sudoer.sh"
execute_script "Do you want to set the timezone and enable NTP" "./common/time.sh"
execute_script "Do you want to extend the LVM volume and resize the filesystem" "./common/lvm.sh"
execute_script "Do you want to update the system and install common tools" "./common/tools.sh"
# Docker
execute_script "Do you want to install Docker and Docker Compose" "./servicers/docker.sh"
# For GitHub Actions
execute_script "Setup Git with your email and name" "./common/git.sh"
# PHP and related installations
execute_script "Do you want to install PHP PPA repository and PHP versions and extensions" "./servicers/php/php.sh"
# MariaDB
execute_script "Do you want to install MariaDB" "./services/mariadb.sh"
# Redis
execute_script "Do you want to install MongoDB" "./services/mongodb.sh"
# MongoDB
execute_script "Do you want to install Redis" "./services/redis.sh"
# GitHub Actions and CI/CD
execute_script "Do you want to install Runner for GitHub Actions" "./services/runner.sh"
echo "Execute ~/action-runners/config.sh --url https://github.com/jooservices --token {your_token} to configure the runner."
# Web servers and related services
execute_script "Do you want to install Virtualmin" "./hosting/virtualmin.sh"
execute_script "Do you want to install Webmin" "./hosting/webmin.sh"
