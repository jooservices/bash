#!/bin/bash

# This script is designed to set up a server with various configurations and installations.
function execute_script() {
    # shellcheck disable=SC2162
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