#!/bin/sh

arg=$1
toggle="--toggle"
status="--status"

if [[ $arg = $toggle ]]; then
    makoctl mode -t dnd &> /dev/null
elif [[ $arg = $status ]]; then
    while sleep 1; do
        stat=$(makoctl mode | awk '/dnd/ { print $1 }')
        if [[ $stat = "dnd" ]]; then
            echo 0;
        else
            echo 1;
        fi
    done
else
    echo "MISSING ARGUMENT"
    exit 1
fi
