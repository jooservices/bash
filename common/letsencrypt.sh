#!/bin/bash
# Script to install Let's Encrypt (Certbot) on Ubuntu/Debian systems

set -e

# Update package list
sudo apt update

# Install Certbot and dependencies
sudo apt install -y certbot python3-certbot-nginx

echo "Let's Encrypt (Certbot) has been installed."
echo "To obtain a certificate, run:"
echo "  sudo certbot --nginx -d yourdomain.com"

