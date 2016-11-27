#!/bin/bash
# screen_on.sh

export DISPLAY=:0.0

#set +x  # debug off 
set -x  # debug on
set -e  # stop on errors

xset +dpms
xset dpms force on
xset -dpms

