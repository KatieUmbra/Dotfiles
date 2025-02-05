#!/bin/sh

# bliking effect
prev=1

while sleep 2; do
    charge=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o "[0-9]*")
    status=$(cat /sys/class/power_supply/BAT0/status)
    status_charging="Charging"
    if [[ $status = $status_charging ]]; then
        if [[ $prev = 1 ]];then
            echo 5
            prev=0
        else
            echo 4
            prev=1
        fi
    elif [[ "$charge" -gt 70 ]]; then
        echo 4
    elif [[ "$charge" -gt 50 ]]; then
        echo 3
    elif [[ "$charge" -gt 30 ]]; then
        echo 2
    elif [[ "$charge" -gt 10 ]]; then
        echo 1
    else
        echo 0
    fi
done
