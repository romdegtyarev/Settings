#! /bin/bash

xhost + $(hostname)
docker run --rm -v /Users/rom/Downloads/console.vv:/home/remoteviewer/download -e DISPLAY=$(hostname):0 -v /tmp/.X11-unix:/tmp/.X11-unix remote-vv

