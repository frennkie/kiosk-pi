#!/bin/bash
set +x
set -e

# --------------------------------------------------------------------
echo ""
echo "APT update + upgrade"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# --------------------------------------------------------------------
echo ""
echo "API clean up"
sudo apt-get -y autoclean
sudo apt-get -y autoremove

# --------------------------------------------------------------------
echo ""
echo "set up NTP"
sudo apt-get install ntpdate
sudo ntpdate -u ntp.ubuntu.com

# --------------------------------------------------------------------
echo ""
echo "install some useful software"
sudo apt-get install git-core vim

