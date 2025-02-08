#!/bin/sh

compare() (IFS=" "
  exec awk "BEGIN{if (!($*)) exit(1)}"
)

arg=$1
icon="--icon"
volume="--volume"

if [[ $arg = $icon ]]; then
    while sleep 0.1;do
        volume=$(awk '{ print $2 }' <(wpctl get-volume @DEFAULT_AUDIO_SINK@))
        muted=$(amixer get Master | tail -2 | grep -c '\[on\]')
        if [[ $muted -eq 0 ]]; then
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

