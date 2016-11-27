#!/bin/bash
set +x
set -e

echo ""
echo "Installing basic X11 packages on HypriotOS"

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
sudo apt-get update
sudo apt-get install -y --no-install-recommends xserver-xorg xinit xserver-xorg-video-fbturbo lxde lxde-common lightdm x11-xserver-utils
sudo apt-get install -y policykit-1 hal
echo "...done"


# --------------------------------------------------------------------
echo ""
echo " STEP 3: enable LightDM autologin for user=pi"
LIGHTDM_CONF_FILE=/etc/lightdm/lightdm.conf
if [ ! -f ${LIGHTDM_CONF_FILE}.sav ]; then
  # backup original file
  sudo mv ${LIGHTDM_CONF_FILE} ${LIGHTDM_CONF_FILE}.sav

cat << EOF | sudo tee ${LIGHTDM_CONF_FILE} >/dev/null
[SeatDefaults]
autologin-user=pi
autologin-user-timeout=0
# don't sleep the screen
xserver-command=X -s 0 dpms
EOF

fi
cat ${LIGHTDM_CONF_FILE}
echo "...done"

# --------------------------------------------------------------------
echo ""
echo "...X11 installation done, please reboot"
