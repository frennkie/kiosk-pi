#!/bin/bash
#set +x  # no debug
set -x  # debug
#set -e  # stop on error

KIOSK_USER=kiosk

# --------------------------------------------------------------------
echo ""
echo "Check for user and add if missing"

id ${KIOSK_USER} > /dev/null 2>&1 

if [ $? -eq 0 ]; then
    echo "User \"${KIOSK_USER}\" exists already. Skipping.."
else
    echo "Create User \"${KIOSK_USER}\" now.."

    sudo adduser \
       --system \
       --shell /bin/bash \
       --gecos "User for kiosk" \
       --group \
       --disabled-password \
       --home /home/kiosk \
       kiosk
fi

# --------------------------------------------------------------------
DFILE="kiosk.sh"
echo ""
echo "Deploying ${DFILE} script to /home/${KIOSK_USER}"
sudo cp ${DFILE} /home/${KIOSK_USER}
sudo chown ${KIOSK_USER}:${KIOSK_USER} /home/${KIOSK_USER}/${DFILE}
sudo chmod a+x /home/${KIOSK_USER}/${DFILE}

# --------------------------------------------------------------------
DFILE="screen_on.sh"
echo ""
echo "Deploying ${DFILE} script to /home/${KIOSK_USER}"
sudo cp ${DFILE} /home/${KIOSK_USER}
sudo chown ${KIOSK_USER}:${KIOSK_USER} /home/${KIOSK_USER}/${DFILE}
sudo chmod a+x /home/${KIOSK_USER}/${DFILE}

# --------------------------------------------------------------------
DFILE="screen_off.sh"
echo ""
echo "Deploying ${DFILE} script to /home/${KIOSK_USER}"
sudo cp ${DFILE} /home/${KIOSK_USER}
sudo chown ${KIOSK_USER}:${KIOSK_USER} /home/${KIOSK_USER}/${DFILE}
sudo chmod a+x /home/${KIOSK_USER}/${DFILE}

# --------------------------------------------------------------------
echo ""
echo "done"
