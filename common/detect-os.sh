#!/bin/bash
# detect-os.sh: Simple script to detect the operating system

if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "Detected OS: $NAME ($ID)"
elif [ "$(uname)" = "Darwin" ]; then
    echo "Detected OS: macOS"
else
    echo "OS could not be detected."
fi
