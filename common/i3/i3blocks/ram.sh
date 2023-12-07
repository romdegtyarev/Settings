#!/bin/bash

# Zakaria Barkouk (Zakaria.gatter@gmail.com)

# Show Memory Usage - 3 (Free)
_MEM_ () {
    icon=""

    mem_usage=$(free -h | awk '/^Mem:/{print $3"/"$2}');
    echo "$icon $mem_usage  "
}

_MEM_

case "$BLOCK_BUTTON" in
    1) ;;
esac

