#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00c3fc'
TEXT='#ffee00e6'
WRONG='#ff0008f4'
VERIFYING='#1eff00f4'

# Pause notifications
dunstctl set-paused true

# Enable the lock screen
i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
-f                           \
--radius 180                 \
--ring-width 12              \
--screen 1                   \
--blur 9                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--keylayout 2                \
--verif-text="Making call to Mr. Rom"    \
--wrong-text="Suck!"                     \
--noinput-text="Type?"                   \
--lock-text="Get Out From My PC"         \
--lockfailed-text="Lock failed!"

# Restore notifications
dunstctl set-paused false

