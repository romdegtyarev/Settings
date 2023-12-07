#!/bin/bash

# Zakaria Barkouk (Zakaria.gatter@gmail.com)

# Show Date and Time - 5 (Date)
_DATE_ () {
    icon=""
    date_time=`date '+%j %a %b %d %I:%M:%S %p'`;
    echo "$icon $date_time  "
}

_DATE_

case "$BLOCK_BUTTON" in
    1) exec korganizer ;;
esac

