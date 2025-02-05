#!/bin/sh

action=$1
player="--player"
position="--position"

if [ $action = $player ]; then
    playerctl metadata --follow --format \
        '{"title":"{{markup_escape(title)}}","album":"{{album}}","artist":"{{artist}}","art":"{{mpris:artUrl}}","url":"{{xesam:url}}","length":"{{mpris:length}}","lengthFormat":"{{duration(mpris:length)}}","status":"{{status}}","shuffle":"{{shuffle}}","loop":"{{loop}}"}'
elif [ $action = $position ]; then
    playerctl metadata --follow --format '{"position":"{{position}}","positionFormat":"{{duration(position)}}"}'
else
    exit 1
fi

