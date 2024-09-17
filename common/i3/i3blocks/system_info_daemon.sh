#!/bin/bash


SERVER="localhost"
PORT=12345


get_temp() {
    icon=""
    temp=$(sensors | grep 'Package id 0' | awk -F ':' '{print $2}' | awk '{print $1}')
    echo "$icon $temp"
}

get_disk_usage() {
    icon=""
    disk_usage=$(df -h / | awk '/\//{print $3"/"$2}')
    echo "$icon $disk_usage"
}

get_mem_usage() {
    icon=""
    mem_usage=$(free -h | awk '/^Mem:/{print $3"/"$2}')
    echo "$icon $mem_usage"
}

functions=(get_temp get_disk_usage get_mem_usage)
index=0

while true; do
    index=$(( (index + 1) % ${#functions[@]} ))
    sleep 10
    {
        ${functions[$index]}
    } | nc -l -p $PORT
done

