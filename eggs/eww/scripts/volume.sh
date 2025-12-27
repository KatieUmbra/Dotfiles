#!/bin/sh

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# ▗▖ ▗▖ ▗▄▖▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖▗▄▄▖    ▗▄▄▄  ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖   ▗▄▄▄▖ ▗▄▄▖
# ▐▌▗▞▘▐▌ ▐▌ █  ▐▌ ▐▌ ▝▚▞▘▐▌       ▐▌  █▐▌ ▐▌ █  ▐▌     █  ▐▌   ▐▌   ▐▌
# ▐▛▚▖ ▐▛▀▜▌ █  ▐▛▀▜▌  ▐▌  ▝▀▚▖    ▐▌  █▐▌ ▐▌ █  ▐▛▀▀▘  █  ▐▌   ▐▛▀▀▘ ▝▀▚▖
# ▐▌ ▐▌▐▌ ▐▌ █  ▐▌ ▐▌  ▐▌ ▗▄▄▞▘    ▐▙▄▄▀▝▚▄▞▘ █  ▐▌   ▗▄█▄▖▐▙▄▄▖▐▙▄▄▖▗▄▄▞▘
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
# Author: Katherine C. (katherine@kaytea.dev)
# Source: http://github.com/KatieUmbra/Dotfiles
# License: MIT
# Description: eww helper shell script that tracks/toggles the volume

compare() (IFS=" "
  exec awk "BEGIN{if (!($*)) exit(1)}"
)

arg=$1
icon="--icon"
volume="--volume"

if [[ $arg = $icon ]]; then
    while sleep 0.1;do
        volume=$(awk '{ print $2 }' <(wpctl get-volume @DEFAULT_AUDIO_SINK@))
        muted=$(wpctl get-volume @DEFAULT_SINK@ | grep MUTED)
        if [[ $? -eq 0 ]]; then
            echo 5
        elif compare "$volume == 0"; then
            echo 5
        elif compare "$volume < 0.25"; then
            echo 1
        elif compare "$volume < 0.50"; then
            echo 2
        elif compare "$volume < 0.75"; then
            echo 3
        else
            echo 4
        fi
    done
elif [[ $arg = $volume ]]; then
    echo "0"
    while sleep 0.1;do
        volume=$(awk '{ print $2 }' <(wpctl get-volume @DEFAULT_AUDIO_SINK@))
        echo $volume
    done
fi

