#!/bin/bash

VAL=$(xset -q | grep LED | cut -d ':' -f 4)

case $VAL in
    *"00000000"*)
        echo "En  "
        ;;
    *"00000002"*)
        echo "En  "
        ;;
    *"00001000"*)
        echo "Ru  "
        ;;
    *"00001002"*)
        echo "Ru  "
        ;;
    *)
        echo $VAL
        echo
        echo '#FF0000'
        ;;
esac

