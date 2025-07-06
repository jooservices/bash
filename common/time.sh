#!/bin/bash

## Timezone and NTP settings
echo "Setting timezone to Asia/Ho_Chi_Minh and enabling NTP..."
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp on