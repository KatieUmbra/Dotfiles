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
# Description: zsh profile file that autostarts niri
#
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    dbus-run-session niri --session >> "$HOME/.cache/niri-logs.txt"
fi
