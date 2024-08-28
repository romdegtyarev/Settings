#!/bin/bash

LAYOUT_INFO=$(xkblayout-state print "%s(%e)")
LAYOUT=$(echo "$LAYOUT_INFO" | cut -d' ' -f1)
CODE=$(echo "$LAYOUT_INFO" | cut -d'(' -f1)

case $CODE in
    "us")
        echo "🇺🇸  "
        ;;
    "ru")
        echo "🇷🇺  "
        ;;
    "fr")
        echo "🇫🇷  "
        ;;
    *)
        echo "$LAYOUT_INFO"
        echo
        echo '#FF0000'
        ;;
esac

