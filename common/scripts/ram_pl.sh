#!/bin/bash

# Zakaria Barkouk (Zakaria.gatter@gmail.com)

# Show Memory Usage - 3 (Free)
_MEM_ () {
    mem_usage=$(free -h | awk '/^Mem:/{print $3"/"$2}');
    echo "$mem_usage"
}

_MEM_

