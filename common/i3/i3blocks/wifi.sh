
#!/bin/bash

# Show Wifi info; ip; connected name; level;
_WIFI_ () {

    icon=""

    W_IP=$(ifconfig wlp3s0 | awk '/inet /{print $2}' | cut -d: -f2);
    W_SSID=$(iwconfig wlp3s0 | awk '/ESSID:/{print $4}' | awk -F '"' '{print $2}');
    W_LEVEL=$(iwconfig wlp3s0 | awk '/Signal level=/{print $4 $5}' | awk -F '=' '{print $2}');

    echo "$icon $W_LEVEL "
}

_WIFI_

case "$BLOCK_BUTTON" in
    1) nm-applet ;;
esac

