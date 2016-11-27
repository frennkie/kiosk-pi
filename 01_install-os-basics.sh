#!/bin/bash
set +x  # debug off
set -e  # exit on error

# --------------------------------------------------------------------
echo ""
echo "APT update + upgrade"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# --------------------------------------------------------------------
echo ""
echo "APT clean up"
sudo apt-get -y autoclean
sudo apt-get -y autoremove

# --------------------------------------------------------------------
echo ""
echo "set up NTP"
sudo apt-get install -y ntpdate
sudo ntpdate -u ntp.ubuntu.com

# --------------------------------------------------------------------
echo ""
echo "install some useful software"
sudo apt-get install -y git-core vim

