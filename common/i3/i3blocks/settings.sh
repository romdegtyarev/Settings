#!/bin/bash

_DATE_ () {
    icon=""
    echo "  $icon  "
    feh --randomize --bg-fill ~/Pictures/Wallpapers/*
}

_DATE_

case "$BLOCK_BUTTON" in
    1) exec gnome-control-center ;;
esac

