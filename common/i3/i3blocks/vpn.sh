#!/bin/bash

icon_on="🟢"
icon_off="🔴"

# Show VPN info; ip; connected name
_VPN_ () {
    local interface=$1

    clean_interface=${interface%%@*}
    local ip=$(ifconfig "$clean_interface" | awk '/inet /{print $2}' | cut -d: -f2)
    if [[ -n $ip ]]; then
        echo "VPN $icon_on "
    else
        echo "VPN $icon_off "
    fi
}

output=""
vpn_found=false
for interface in $(ip link show | awk -F': ' '{print $2}'); do
    if [[ $interface == tun* || $interface == tap* || $interface == wg* || $interface == veth0* ]]; then
        output+=$(_VPN_ "$interface")
        vpn_found=true
    fi
done
if [[ $vpn_found == false ]]; then
    echo "VPN $icon_off "
else
    echo "$output"
fi

case "$BLOCK_BUTTON" in
    1) exec nm-connection-editor ;;
esac

