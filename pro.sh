#!/bin/bash
sudo -i || su root 
yum install sudo git wget vim && apt install sudo git wget vim 
sudo rm -rf /root/1 || sudo rm -rf /var/1 
git clone https://github.com/xvmvx/1.git /var/1
chmod +x /var/1/*
source /var/1/1.sh