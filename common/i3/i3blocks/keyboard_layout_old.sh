#!/bin/bash

VAL=$(xset -q | grep LED | cut -d ':' -f 4)

case $VAL in
    *"00000000"*)
        echo "🇺🇸  "
        ;;
    *"00000002"*)
        echo "🇺🇸  "
        ;;
    *"00001000"*)
        echo "🇷🇺  "
        ;;
    *"00001002"*)
        echo "🇷🇺  "
        ;;
    *)
        echo $VAL
        echo
        echo '#FF0000'
        ;;
esac

