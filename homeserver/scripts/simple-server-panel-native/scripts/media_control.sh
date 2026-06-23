#!/bin/bash

#Start
if [[ $# -lt 1 ]]
then
    echo "Enter mode"
    exit 0
fi

mode=$1

if [[ $mode == "Start" ]]
then
    #Before start
    echo "Start"
    sudo mount -t ntfs /dev/sdc1 /samba/private
    sudo mount /dev/sdb /samba/private/TV_NEW
    sudo systemctl restart minidlna.service
    echo "sudo nut-scanner -U"

elif [[ $mode == "Stop" ]]
then
    #Before stop
    echo "Stop"
    sudo umount /samba/private/TV_NEW
    sudo umount /samba/private

else
    echo "Invalid mode"
fi

