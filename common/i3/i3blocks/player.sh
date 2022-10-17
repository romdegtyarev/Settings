#!/bin/bash

# Zakaria Barkouk (Zakaria.gatter@gmail.com)

# Show mpd Playing song and status - 14 (mpd; ncmpccp, mpc)
_MPD_ () {
    icon=""
    NCMP=$(mpc | awk '/^\[playing\]/{print $1}')
    _NCMP=$(mpc | head -1 )

    if [ "$NCMP" = "[playing]" ];then 
        echo "$icon  $(basename $(mpc current))  "
    else
        echo "$icon   "
    fi
}

_MPD_

