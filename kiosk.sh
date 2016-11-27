#!/bin/bash
# kiosk.sh

#export DISPLAY=:0.0

# start chromium
chromium-browser --noerrdialogs --disable-session-crashed-bubble --disable-infobars --kiosk http://co2.rhab.de
