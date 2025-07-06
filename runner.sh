#!/bin/bash

version=$(curl -I -v -s https://github.com/actions/runner/releases/latest 2>&1 | perl -ne 'next unless s/^< location: //; s{.*/v}{}; s/\s+//; print')

cd ~
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-${version}.tar.gz -L https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-x64-${version}.tar.gz
#echo "${hash}  actions-runner-linux-x64-${version}.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-${version}.tar.gz
