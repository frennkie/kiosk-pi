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
echo "Download the scripts from Github manually:"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/02_install-x11-basics.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/03_install-browser.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/04_add-user.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/05_setup-x11.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/kiosk.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/screen_off.sh"
echo "wget https://raw.githubusercontent.com/frennkie/kiosk-pi/master/screen_on.sh"
