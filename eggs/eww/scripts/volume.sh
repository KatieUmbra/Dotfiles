#!/bin/sh

arg=$1
icon="--icon"
volume="--volume"

if [[ $arg = $icon ]]; then
    while sleep 0.1;do
        volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | grep -o ".[0-9]")
        muted=$(amixer get Master | sed 6q | grep -q '\[on\]')
        if !($muted); then
            echo 5
        elif [[ $volume -lt 25 ]]; then
            echo 1
        elif [[ $volume -lt 50 ]]; then
            echo 2
        elif [[ $volume -lt 75 ]]; then
            echo 3
        else
            echo 4
        fi
    done
elif [[ $arg = $volume ]]; then
    echo "0"
    while sleep 0.1;do
        volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | grep -o ".[0-9]")
        echo $volume
    done
fi

