## Bash scripts for daily usage

This repository contains a collection of Bash scripts for various daily tasks and server management. Below is the current structure and available scripts:


### Top-level scripts

- `aio.sh` — **All-in-one setup script**
- `docker.sh`
- `git.sh`
- `mariadb.sh`
- `redis.sh`
- `runner.sh`
- `ubuntu-generator.sh`
- `virtualbox.sh`
- `virtualmin.sh`
- `webmin.sh`
- `xcrawler.sh`
- `mongodb.sh`

---

## How to use `aio.sh`

The `aio.sh` script is an interactive all-in-one setup tool that helps you quickly configure a new server or environment. It will prompt you for each step and execute the corresponding scripts based on your answers.

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

### Folders and their scripts

#### `common/`
- `lvm.sh`
- `sudoer.sh`
- `time.sh`
- `tools.sh`

#### `grafana/`
- `grafana.sh`
- `prometheus.sh`

#### `hosting/`
- `virtualmin.sh`
- `webmin.sh`

#### `php/`
- `install.sh`
- `php.sh`
- `ppa.sh`

#### `VM/`
- `lvm.sh`