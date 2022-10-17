#/bin/bash

icon=""
temp=`sensors | grep Package | awk -F ':' '{print $2}' | awk '{print $1}'`

echo "$temp"

