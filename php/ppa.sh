#!/bin/bash

echo 'Install requirements'

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt upgrade -y