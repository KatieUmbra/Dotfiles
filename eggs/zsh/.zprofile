if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    dbus-run-session niri --session >> "$HOME/.cache/niri-logs.txt"
fi
