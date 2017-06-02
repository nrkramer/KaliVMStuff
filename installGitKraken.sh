#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
        echo "Need root permissions for install to work. Please run as root."
        exit
fi

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
