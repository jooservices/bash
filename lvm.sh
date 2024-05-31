#!/bin/bash

sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp on
