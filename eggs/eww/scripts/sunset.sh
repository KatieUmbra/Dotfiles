#!/bin/sh

arg=$1
status="--status"
toggle="--toggle"

if [[ $arg = $toggle ]]; then
    pgrep hyprsunset &> /dev/null
    state=$?
    if [[ $state -eq 0 ]];then
        pkill hyprsunset
    else
        nohup hyprsunset -t 4000 &> /dev/null &
    fi
elif [[ $arg = $status ]]; then
    while sleep 0.5; do
        pgrep hyprsunset &> /dev/null
        echo $?
    done
else
    echo "MISSING ARGUMENT"
    exit 1
fi

