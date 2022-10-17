#!/bin/bash

#icon=""
weather=`curl -s wttr.in/\?format\='%l:+%c%20%t%60%w&period=60'`;
weather_short=`echo "$weather" | awk -F ':' '{print $2}'`;
echo "$weather_short  "

