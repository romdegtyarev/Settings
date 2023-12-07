#!/bin/bash

# Zakaria Barkouk (Zakaria.gatter@gmail.com)

# Show Disk Usage - 7 (df)
_DISK_ () {
    icon=""
    disk_usage=$(df -h "$1" | awk '/\/dev\//{print $3-G"/"$2}');
    echo "$icon $disk_usage  "
}

_DISK_ "$1"

case "$BLOCK_BUTTON" in
    1) ;;
esac

