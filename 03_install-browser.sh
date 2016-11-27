#!/bin/bash
set +x  # debug off
set -e  # exit on error

echo ""
echo "Install browser"

# --------------------------------------------------------------------
echo ""
echo " STEP 1: install chromium"
sudo apt-get install -y chromium-browser rpi-chromium-mods
echo "...done"

