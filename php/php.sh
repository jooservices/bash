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

execute_script "Add PHP PPA repository and install PHP versions and extensions" "./ppa.sh"

execute_script "Install PHP 8.4 and extensions" "./install.sh"