#!/bin/sh

for f in $HOME/.config/scripts/startup/*.sh; do
    zsh "$f"
done
