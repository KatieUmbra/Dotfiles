#!/bin/sh

arg=$1
toggle="--toggle"
status="--status"

if [[ $arg = $toggle ]]; then
    bluetooth toggle &> /dev/null
elif [[ $arg = $status ]]; then
    while sleep 1; do
        stat=$(rfkill -n | awk '/bluetooth/ { print $4 }')
        if [[ $stat = "blocked" ]]; then
            echo 1;
        else
            echo 0;
        fi
    done
else
    echo "MISSING ARGUMENT"
    exit 1
fi
