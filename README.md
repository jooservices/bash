## Bash scripts for daily usage

This repository contains a collection of Bash scripts and utilities designed to automate and simplify common system administration and development tasks.
The scripts are organized by category for easy navigation and usage.

## Top-level Scripts

- `aio.sh` — **Master script to execute multiple automation tasks at once. Useful for batch operations or setting up environments quickly**
- `xcrawler.sh`
- **ubuntu-generator.sh**: Automates the generation of Ubuntu server configuration files and setup scripts.
- **virtualbox.sh**: Provides utilities for managing VirtualBox virtual machines, including creation, configuration, and automation.
- **xcrawler.sh**: Contains scripts for web crawling and automation tasks, suitable for scraping or monitoring web resources.

---
## Directory Structure and Usage

### Directories
- **common/**: General-purpose scripts (e.g., git, lvm, sudoer, time, tools).
- **grafana/**: Scripts for setting up and managing Grafana and Prometheus.
- **hosting/**: Scripts for hosting management (Virtualmin, Webmin).
- **php/**: PHP environment setup and management (install, ppa, php).
- **services/**: Service management scripts (Docker, MariaDB, MongoDB, Redis, runner).
- **VM/**: Virtual machine and LVM management scripts.

### common/
General-purpose scripts for system administration:
- **git.sh**: Git utilities and automation.
- **lvm.sh**: Logical Volume Manager (LVM) management scripts.
- **sudoer.sh**: Manage sudoers and permissions.
- **time.sh**: Time and date utilities.
- **tools.sh**: Miscellaneous helper tools.

## How to use `aio.sh`

The `aio.sh` script is an interactive all-in-one setup tool that helps you quickly configure a new server or environment.
It will prompt you for each step and execute the corresponding scripts based on your answers.

### Usage

```bash
chmod +x aio.sh
./aio.sh
```

You will be asked a series of yes/no questions for each setup task, such as:
- Setting up passwordless sudo
- Setting timezone and enabling NTP
- Extending LVM volume
- Installing common tools
- Installing Docker & Docker Compose
- Setting up Git
- Installing PHP (with PPA and extensions)
- Installing MariaDB
- Installing Redis
- Installing GitHub Actions Runner (with a reminder to configure it)
- Installing Virtualmin and Webmin

Simply answer `yes` or `no` to each prompt. The script will skip any steps you decline.

**Note:** For GitHub Actions Runner, after installation, you need to manually configure it using:

```bash
~/action-runners/config.sh --url https://github.com/jooservices --token {your_token}
```

---

Usage example:
```bash
bash common/git.sh
```

### grafana/
Scripts for monitoring stack setup:
- **grafana.sh**: Install and configure Grafana.
- **prometheus.sh**: Install and configure Prometheus.

Usage example:
```bash
bash monitor/monitor.sh
```

### hosting/
Web hosting management scripts:
- **virtualmin.sh**: Automate Virtualmin setup and management.
- **webmin.sh**: Automate Webmin setup and management.

Usage example:
```bash
bash hosting/webmin.sh
```

### php/
PHP environment management:
- **install.sh**: Install PHP and dependencies.
- **php.sh**: PHP configuration and utilities.
- **ppa.sh**: Manage PHP PPAs (Personal Package Archives).

Usage example:
```bash
bash php/install.sh
```

### services/
Service management scripts:
- **docker.sh**: Install and manage Docker.
- **mariadb.sh**: Install and manage MariaDB.
- **mongodb.sh**: Install and manage MongoDB.
- **redis.sh**: Install and manage Redis.
- **runner.sh**: Manage service runners or background jobs.

Usage example:
```bash
bash services/docker.sh
```

### VM/
Virtual machine and storage management:
- **lvm.sh**: LVM utilities for VMs and storage.

Usage example:
```bash
bash VM/lvm.sh
```

## Requirements
- Bash (v4+ recommended)
- Some scripts may require root privileges (use `sudo` as needed)
- Additional dependencies may be required for specific scripts (see script comments)

## Contribution
Feel free to contribute by submitting pull requests or opening issues for bugs and feature requests.

## License
This repository is licensed under the MIT License.
