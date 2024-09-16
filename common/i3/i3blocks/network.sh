#!/bin/bash

# Show ETH info; ip; connected name
_ETH_ () {

    icon=""

    W_IP=$(ifconfig enp3s0 | awk '/inet /{print $2}' | cut -d: -f2);
    W_IP_2=$(ifconfig enp2s0 | awk '/inet /{print $2}' | cut -d: -f2);
    W_IP_3=$(ifconfig enp0s20u7 | awk '/inet /{print $2}' | cut -d: -f2);

    if [[ $W_IP || $W_IP_2 || $W_IP_3 ]]; then
        echo "$icon 3:$W_IP 2:$W_IP_2 U:$W_IP_3 "
    else
        echo "$icon NOT  "
    fi
}

_ETH_

case "$BLOCK_BUTTON" in
    1) exec nm-connection-editor ;;
esac

