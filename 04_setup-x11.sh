#!/bin/bash
set +x
set -e

KIOSK_USER=kiosk

echo ""
echo "Setup X11"

# --------------------------------------------------------------------
echo ""
echo " STEP 1: enable LightDM autologin for user=${KIOSK_USER}"
LIGHTDM_CONF_FILE=/etc/lightdm/lightdm.conf
if [ ! -f ${LIGHTDM_CONF_FILE}.sav ]; then
  # backup original file
  sudo mv ${LIGHTDM_CONF_FILE} ${LIGHTDM_CONF_FILE}.sav

cat << EOF | sudo tee ${LIGHTDM_CONF_FILE} >/dev/null
[SeatDefaults]
autologin-user=${KIOSK_USER}
autologin-user-timeout=0
# don't sleep the screen
xserver-command=X -s 0 dpms
EOF

fi
cat ${LIGHTDM_CONF_FILE}
echo "...done"

# --------------------------------------------------------------------
echo ""
echo " STEP 2: configure LXDE autostart to run kiosk.sh"
LXDE_AUTOSTART_FILE=/home/${KIOSK_USER}/.config/lxsession/LXDE/autostart
if [ ! -f ${LXDE_AUTOSTART_FILE}.sav ]; then
  # backup original file
  sudo mv ${LXDE_AUTOSTART_FILE} ${LXDE_AUTOSTART_FILE}.sav

cat << EOF | sudo tee ${LXDE_AUTOSTART_FILE} >/dev/null
@xset s off
@xset -dpms
@xset s noblank
@/home/${KIOSK_USER}/kiosk.sh
EOF

fi


# --------------------------------------------------------------------
echo ""
echo " STEP 4: deploy kiosk.sh script to /home/${KIOSK_USER}"
KIOSK_SCRIPT_FILE=/home/${KIOSK_USER}/kiosk.sh
if [ ! -f ${KIOSK_SCRIPT_FILE} ]; then
    sudo cp kiosk.sh ${KIOSK_SCRIPT_FILE}
    sudo chown ${KIOSK_USER}:${KIOSK_USER} ${KIOSK_SCRIPT_FILE}
    sudo chmod a+x ${KIOSK_SCRIPT_FILE}
fi




# --------------------------------------------------------------------
echo ""
echo " STEP 3: enable boot to graphical mode"
sudo systemctl set-default graphical.target

# --------------------------------------------------------------------
echo ""
echo "...X11 setup done, please reboot"
