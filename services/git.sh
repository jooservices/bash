#!/bin/bash

email="jooservices@gmail.com"
name="Viet Vu"

sudo apt update && sudo apt upgrade -y
sudo apt -y install git
git config --global user.email ${email}
git config --global user.name ${name}

ssh-keygen -t ed25519 -C $email
