#!/bin/sh

arg=$1
status="--status"
toggle="--toggle"

if [[ $arg = $toggle ]]; then
    state=$(connmanctl state | awk '/State/ { print $3 }')
    if [[ $state = "online" ]];then
        connmanctl disable wifi &> /dev/null
    else
        connmanctl enable wifi &> /dev/null
    fi
elif [[ $arg = $status ]]; then
    while sleep 0.5; do
        stat=$(connmanctl state | awk '/State/ { print $3 }')
        if [[ $stat = "online" ]]; then
            echo 0;
        else
            echo 1;
        fi
    done
else
    echo "MISSING ARGUMENT"
    exit 1
fi

