#!/bin/bash

_NUPHY_ () {
    icon=""
    per_cent=$(upower -i /org/freedesktop/UPower/devices/keyboard_dev_DE_50_E1_96_7B_C9 | grep percentage: | awk '{print $NF}');
    echo "$icon  $per_cent  "
}

_NUPHY_

case "$BLOCK_BUTTON" in
    1) ;;
esac

