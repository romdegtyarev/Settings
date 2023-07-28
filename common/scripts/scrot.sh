#!/bin/bash

arg=$1

scrot $arg '%Y-%m-%d_%H:%M:%S_$wx$h_scrot.png' -e 'mv $f ~/Pictures/'

