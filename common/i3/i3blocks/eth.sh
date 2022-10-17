#!/bin/bash

# Show ETH info; ip; connected name
_ETH_ () {

    icon=""

    W_IP=$(ifconfig enp2s0 | awk '/inet /{print $2}' | cut -d: -f2);

    if [[ $W_IP ]]; then
        echo "$icon 2:$W_IP "
    else
        echo "$icon NOT  "
    fi
}

_ETH_

case "$BLOCK_BUTTON" in
    1) exec gnome-nettool ;;
esac

