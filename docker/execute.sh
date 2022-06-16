#!/bin/bash

cd ~
wget https://raw.githubusercontent.com/jooservices/bash/main/docker/docker-compose.yml
docker-compose up -d --force-recreate
