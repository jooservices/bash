#!/bin/bash

echo "Installing Homebrew..."
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installed successfully."
else
    brew update && brew upgrade
    echo "Homebrew is already installed. Updated to the latest version."
fi