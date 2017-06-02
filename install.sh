#!/bin/bash

./installVBoxGuestAdditions.sh

echo "$PWD"
# Write Run-Once reboot script (backup .profile)
touch ~/.profile
cp ~/.profile $PWD/.profile_backup
################ Reboot script ###################
onReboot="cd $PWD && gnome-terminal -e \"./installSoapySDR.sh && ./installGitKraken\""
##################################################
echo "$onReboot && mv $PWD/.profile_backup ~/.profile" >> ~/.profile

# Reboot
read -p "A reboot is required in order to continue. Reboot now? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    reboot
fi
