#!/bin/bash

curl -L https://raw.githubusercontent.com/jooservices/bash/main/git.sh | bash
curl -L https://raw.githubusercontent.com/jooservices/bash/main/multi-php.sh | bash

curl -L https://raw.githubusercontent.com/jooservices/bash/main/runner.sh | bash
curl -L https://raw.githubusercontent.com/jooservices/bash/main/docker.sh | bash

sudo apt -y autoclean && sudo apt -y autoremove
