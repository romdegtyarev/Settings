#/bin/bash

icon=""
temp=`sensors | grep Packa | awk -F ':' '{print $2}' | awk '{print $1}'`

echo "$icon $temp  "

