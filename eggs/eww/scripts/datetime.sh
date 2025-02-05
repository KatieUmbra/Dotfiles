#!/bin/sh

while sleep 1; do
    date +'{"hour":"%I","minute":"%M","second":"%S","meridian":"%p","weekday":"%A","month":"%b","day":"%d"}'
done
