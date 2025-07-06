#!/bin/bash

function execute_script() {
    read -p "$1? (yes/no) " yn

    case $yn in
        [Yy]* )        
            bash "$2"
            ;;
        [Nn]* )
            echo "Skipping."
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
}

execute_script "Do you want to set up passwordless sudo for the current user" "./common/sudoer.sh"
execute_script "Do you want to set the timezone and enable NTP" "./common/time.sh"
execute_script "Do you want to extend the LVM volume and resize the filesystem" "./common/lvm.sh"

execute_script "Do you want to update the system and install common tools" "./common/tools.sh"
execute_script "Do you want to install Docker and Docker Compose" "./docker.sh"

execute_script "Setup Git with your email and name" "./git.sh"

execute_script "Do you want to install PHP PPA repository and PHP versions and extensions" "./php/php.sh"
execute_script "Do you want to install MariaDB" "./mariadb.sh"
execute_script "Do you want to install Redis" "./redis.sh"

execute_script "Do you want to install Runner for GitHub Actions" "./runner.sh"
echo "Execute ~/action-runners/config.sh --url https://github.com/jooservices --token {your_token} to configure the runner."

execute_script "Do you want to install Virtualmin" "./virtualmin.sh"
execute_script "Do you want to install Webmin" "./webmin.sh"