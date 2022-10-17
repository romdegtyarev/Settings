#!/bin/bash

MUTE=`pamixer --get-mute`

icon=""

if [[ $MUTE == "true" ]]; then
    echo "$icon M  "
else
    echo "$icon `pamixer --get-volume-human`  "
fi

case "$BLOCK_BUTTON" in
    1) exec pavucontrol ;;
esac

