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
# Description: script to change volume while doing some other stuff

action=$1
amount=$2
notify=$3
higher="--higher"
lower="--lower"
mute="--mute"
nonotify="--no-notify"

changes=$HOME/.config/eww/scripts/changes

if [ "$#" -eq 0 ]; then
    echo "Error: Not enough arguments!"
    exit 1
fi

if [ "$#" -ge 4 ]; then
    echo "Error: Too many arguments!"
    exit 1
fi

if [[ $action = $higher ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $2+ --limit 1.0
    if [[ $notify -eq $nonotify ]]; then
        exit 0
    fi
    mpv --volume=200 $HOME/.config/yolk/eggs/assets/volume_up.mp3 &> /dev/null
elif [[ $action = $lower ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $2- --limit 1.0
    if [[ $notify -eq $nonotify ]]; then
        exit 0
    fi
    mpv --volume=200 $HOME/.config/yolk/eggs/assets/volume_down.mp3 &> /dev/null
elif [[ $action = $mute ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    if [[ $notify -eq $nonotify ]]; then
        exit 0
    fi
else
    echo "Error: Wrong argument!"
    exit 1
fi


echo "" > $changes
