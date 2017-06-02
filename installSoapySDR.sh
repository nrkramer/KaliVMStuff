#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
        echo "Need root permissions for install to work. Please run as root."
        exit
fi

apt install -y -qq dirmngr

cp add-apt-repository.sh.txt /usr/sbin/add-apt-repository
chmod o+x /usr/sbin/add-apt-repository
chown root:root /usr/sbin/add-apt-repository

/usr/sbin/add-apt-repository ppa:pothosware/framework
/usr/sbin/add-apt-repository ppa:pothosware/support
/usr/sbin/add-apt-repository ppa:myriadrf/drivers

apt update -qq

echo "--------------- Installing Pothos --------------------"
apt install -y -qq pothos-all

echo "-------------- Installing SoapySDR -------------------"
apt install -y -qq soapysdr

echo "----------- Installing RTL-SDR Support ---------------"
apt install -y -qq soapysdr-module-rtlsdr

echo "----------- Installing HackRF Support ----------------"
apt install -y -qq soapysdr-module-hackrf

echo "-------------- INSTALLATION RESULTS ------------------"
PothosUtil --system-info
SoapySDRUtil --info

echo "Done!"
echo "Now run PothosGui and watch those bits fly!"
