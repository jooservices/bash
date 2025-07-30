#!/bin/bash

echo "Setting up common tools..."
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common
sudo apt install nano unzip zip git -y