#!/bin/bash

email="jooservices@gmail.com"
name="Viet Vu"

sudo apt -y install git
git config --global user.email "${email}"
git config --global user.name "${name}"

ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519 <<<y >/dev/null 2>&1
