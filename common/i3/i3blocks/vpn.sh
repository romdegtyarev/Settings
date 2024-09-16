#!/bin/bash

# Show ETH info; ip; connected name
_ETH_ () {

    icon=""

    W_IP=$(ifconfig wg0 | awk '/inet /{print $2}' | cut -d: -f2);

    if [[ $W_IP ]]; then
        echo "$icon On "
    else
        echo "$icon Off  "
    fi
}

_ETH_

case "$BLOCK_BUTTON" in
    1) exec nm-connection-editor ;;
esac

