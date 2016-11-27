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
echo ""
echo "done"
