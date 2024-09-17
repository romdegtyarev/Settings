#!/bin/bash

# Show ETH info; ip; connected name
_ETH_ () {
    local interface=$1
    local icon_on="🟢"
    local icon_off="🔴"

    local ip=$(ifconfig "$interface" | awk '/inet /{print $2}' | cut -d: -f2)
    local interface_name=$(echo "$interface" | sed 's/^[^0-9]*//')

    if [[ -n $ip ]]; then
        echo "$interface_name: $icon_on "
    else
        echo "$interface_name: $icon_off "
    fi
}

output=""
output+=$(_ETH_ "enp3s0")
output+=$(_ETH_ "enp2s0")
output+=$(_ETH_ "enp0s20u7")
echo "$output"

case "$BLOCK_BUTTON" in
    1) exec nm-connection-editor ;;
esac

