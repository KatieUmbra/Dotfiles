if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec niri --session
fi
