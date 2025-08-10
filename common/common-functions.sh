#!/bin/bash
# common-functions.sh: Common utility functions for bash scripts

get_os_name() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$NAME"
    elif [ "$(uname)" = "Darwin" ]; then
        echo "macOS"
    else
        echo "Unknown OS"
    fi
}

get_os_codename() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ -n "$VERSION_CODENAME" ]; then
            echo "$VERSION_CODENAME"
        elif [ -n "$UBUNTU_CODENAME" ]; then
            echo "$UBUNTU_CODENAME"
        else
            echo "Unknown Codename"
        fi
    elif [ "$(uname)" = "Darwin" ]; then
        sw_vers -productVersion | awk -F. '{print "macOS-" $1 "." $2}'
    else
        echo "Unknown Codename"
    fi
}

# Function to show system information
show_system_info() {
    echo "==============================="
    echo " System Information"
    echo "==============================="
    echo "OS Name: $(get_os_name)"
    echo "OS Codename: $(get_os_codename)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime -p)"
    echo "Current User: $(whoami)"
    echo "CPU: $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
    echo "Cores: $(nproc)"
    echo "Memory: $(free -h | awk '/Mem:/ {print $2 " total, " $3 " used"}')"
    echo "Disk: $(df -h --total | grep total | awk '{print $2 " total, " $3 " used"}')"
    echo "==============================="
}

# Function to display menu and handle user choice
show_menu() {
    while true; do
        echo "Select an action:"
        echo "1) Run full server setup (aio)"
        echo "2) Exit"
        read -p "Enter your choice [1-2]: " choice
        case $choice in
            1)
                run_aio_setup
                ;;
            2)
                echo "Exiting."
                exit 0
                ;;
            *)
                echo "Invalid choice. Please select 1-2."
                ;;
        esac
    done
}

# Function to run the original aio setup steps
run_aio_setup() {
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

    if [ "$(get_os_name)" == "macOS" ]; then
        execute_script "Do you want to install Homebrew" "./services/homebrew.sh"
    fi

    if [ "$(get_os_name)" != "macOS" ]; then
         execute_script "Do you want to set up passwordless sudo for the current user" "./common/sudoer.sh"
            execute_script "Do you want to set the timezone and enable NTP" "./common/time.sh"
            execute_script "Do you want to extend the LVM volume and resize the filesystem" "./common/lvm.sh"
            execute_script "Do you want to install and configure git" "./common/git.sh"
            execute_script "Do you want to update the system and install common tools" "./common/tools.sh"
            execute_script "Do you want to install Docker and Docker Compose" "./services/docker.sh"
            execute_script "Setup Git with your email and name" "./git.sh"
            execute_script "Do you want to install PHP PPA repository and PHP versions and extensions" "./services/php/php.sh"
            execute_script "Do you want to install MariaDB" "./services/mariadb.sh"
            execute_script "Do you want to install MongoDB" "./services/mongodb.sh"
            execute_script "Do you want to install Redis" "./services/redis.sh"
            execute_script "Do you want to install Runner for GitHub Actions" "./services/runner.sh"
            echo "Execute ~/action-runners/config.sh --url https://github.com/jooservices --token {your_token} to configure the runner."
            execute_script "Do you want to install Virtualmin" "./hosting/virtualmin.sh"
            execute_script "Do you want to install Webmin" "./hosting/webmin.sh"
            execute_script "Do you want to install Let's Encrypt (Certbot)" "./common/letsencrypt.sh"
    fi
}