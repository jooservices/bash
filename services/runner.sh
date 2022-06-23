#!/bin/bash

version=$(curl -I -v -s https://github.com/actions/runner/releases/latest 2>&1 | perl -ne 'next unless s/^< location: //; s{.*/v}{}; s/\s+//; print')

#hash='06d62d551b686239a47d73e99a557d87e0e4fa62bdddcf1d74d4e6b2521f8c10'

cd ~
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-${version}.tar.gz -L https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-x64-${version}.tar.gz
#echo "${hash}  actions-runner-linux-x64-${version}.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-${version}.tar.gz
