if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec dbus-run-session hyprland > "$HOME/.cache/hyprland/hyprland_logs.txt"
fi
