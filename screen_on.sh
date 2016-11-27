#!/bin/bash
# screen_on.sh

set +x  # debug off 
#set -x  # debug on
set -e  # stop on errors

export DISPLAY=:0.0

xset +dpms
xset dpms force on
xset -dpms

