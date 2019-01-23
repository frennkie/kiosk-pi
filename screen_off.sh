#!/bin/bash
# screen_on.sh

set -e  # stop on errors

export DISPLAY=:0.0

vcgencmd  display_power 0

# EOF
