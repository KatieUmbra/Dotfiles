# Hyprose Dots

## Instalation

THIS PART IS WORK IN PROGRESS

1. install deps `DEPS HERE` (check hyprland wiki)
    - wofi-emoji inside `~/.local/bin`
    - add lines to `/etc/zsh/zshenv`
        ```sh
        export ZDOTDIR="$HOME/.config/zsh"
        export HISTFILE="$ZDOTDIR/.zsh_history"
        ```

2. clone repo inside `~/.config` DON'T FORGET SUBMODULES

3. run `yolk sync`

4. install gtk and qt themes
    - Gtk:
        - Theme: WhiteSur-Light-Purple
        - Font: Work Sans Regular 12
        - Icons: Numix Circle
        - Cursor: Bibata Modern Ice
    - Qt:
        - Theme: WhiteSur

5. Change starship username

## Roadmap

- [ ] Collect and list all dependencies
- [ ] Comment every file with credits
- [x] Mako config
- [x] Kitty config
- [x] Wofi config
- [x] Starship config
- [x] Zsh config
- [ ] Gtk config
- [ ] Hyprland
    - [x] Base config
    - [x] Clipboard management
    - [x] Emoji
    - [ ] Missing bspwm keybindings
    - [ ] Screen lock
- [ ] Eww
    - [X] Tray
    - [ ] Airplane mode
    - [ ] Calendar widget
    - [ ] Filler for main bar
    - [ ] Refactor
- [x] Gowall colorscheme
- [X] Bat colorscheme
- [X] Btop colorscheme
- [ ] Neovim colorscheme compatibility

## Acknowledgements

- [Lightly inspired by](https://github.com/gh0stzk/dotfiles)
- [Icons by Icons8](https://icons8.com)
