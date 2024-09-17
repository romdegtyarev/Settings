#!/bin/bash


SERVER="localhost"
PORT=12345


response=$(echo "request" | nc --close $SERVER $PORT)

if [[ ! "$response" == *""* && ! "$response" == *""* && ! "$response" == *""* ]]; then
    echo " ⚠️ "
    exit 1
fi

echo " $response "
exit 0

