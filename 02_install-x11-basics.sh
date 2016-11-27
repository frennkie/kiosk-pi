#!/bin/bash
set +x  # debug off
set -e  # exit on error

echo ""
echo "Installing basic X11 packages"

# --------------------------------------------------------------------
echo ""
echo " STEP 1: create a /boot/config.txt"
CONFIG_TXT_FILE=/boot/config.txt
if [ ! -f ${CONFIG_TXT_FILE} ]; then

cat << EOF | sudo tee ${CONFIG_TXT_FILE} >/dev/null
display_rotate=0	# normal HDMI displays
#display_rotate=2	# 7" Touch Screen display from RaspberryPi.Org
EOF

fi
cat ${CONFIG_TXT_FILE}
echo "...done"


# --------------------------------------------------------------------
echo ""
echo " STEP 2: install X11 and LightDM"
sudo apt-get install -y --no-install-recommends xserver-xorg xinit xserver-xorg-video-fbturbo lxde lxde-common lightdm x11-xserver-utils unclutter
sudo apt-get install -y policykit-1 hal
echo "...done"

