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
    sudo mount /dev/sdc1 /samba/private
    sudo mount /dev/sdb /samba/private/TV_NEW
    sudo systemctl restart minidlna.service
    timedatectl set-timezone Asia/Novosibirsk
    sudo ntpdate time.google.com
    echo "sudo nut-scanner -U"
    echo "sudo vim /etc/nut/ups.conf"
    echo "sudo upsdrvctl stop"
    echo "sudo upsdrvctl start"
    echo "sudo systemctl start nut-server.service"
    echo "sudo systemctl start nut-monitor.service"
    echo "cd ~/apps/fiagetapi"
    echo "docker-compose up -d"
    echo "cd ~/apps/vultrapi"
    echo "docker-compose up -d"

elif [[ $mode == "Stop" ]]
then
    #Before stop
    echo "Stop"
    sudo umount /samba/private/TV_NEW
    sudo umount /samba/private

else
    echo "Invalid mode"
fi


