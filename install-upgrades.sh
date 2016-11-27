#!/bin/bash
set +x
set -e

# --------------------------------------------------------------------
echo ""
echo "Installing basic upgrades"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# --------------------------------------------------------------------
echo ""
echo "Clean up"
sudo apt-get -y autoclean
sudo apt-get -y autoremove

