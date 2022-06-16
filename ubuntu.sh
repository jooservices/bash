#!/bin/bash

curl -L https://raw.githubusercontent.com/jooservices/bash/main/services/git.sh | bash
curl -L https://raw.githubusercontent.com/jooservices/bash/main/services/multi-php.sh | bash

curl -L https://raw.githubusercontent.com/jooservices/bash/main/services/runner.sh | bash
curl -L https://raw.githubusercontent.com/jooservices/bash/main/services/docker.sh | bash

sudo apt -y autoclean && sudo apt -y autoremove
