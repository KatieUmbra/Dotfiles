#!/bin/sh

while sleep 0.1; do
    current=$(brightnessctl get)
    max=$(brightnessctl max)

    echo "{\"current\":\"$current\",\"max\":\"$max\"}"
done
