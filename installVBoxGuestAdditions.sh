#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
        echo "Need root permissions for install to work. Please run as root."
        exit
fi

echo "WARNING: This script overwrites the /etc/apt/sources.list to reflect the \"kali-rolling main\" repos. You should only run this script if you are ok with that or are running a fresh install of kali."
read -p "Proceed? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit the script but not the terminal
fi

# Fix apt repos
echo "-----------------Fixing apt repositories-----------------"
echo "# 

# deb cdrom:[Debian GNU/Linux 2016.1 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20160120-18:14]/ kali-rolling contrib main non-free

#deb cdrom:[Debian GNU/Linux 2016.1 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20160120-18:14]/ kali-rolling contrib main non-free

deb http://http.kali.org/kali kali-rolling main contrib non-free
deb-src http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

# Update Kali
echo "-----------------Updating Kali-----------------"

apt update -q && apt -y -q dist-upgrade

# Install Kernel Headers
echo "-----------------Installing kernel headers-----------------"

apt install linux-headers-$(uname -r) -y -qq

# Install guest additions from Kali repo
echo "-----------------Installing VirtualBox Guest Additions-----------------"

apt install virtualbox-guest-x11 -y -qq



