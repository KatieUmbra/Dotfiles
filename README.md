# Kathy's Dotfiles

## Instalation

THIS PART IS WORK IN PROGRESS

1. install deps `DEPS HERE` (check hyprland wiki)
    - wofi-emoji inside `~/.local/bin`
    - add lines to `/etc/zsh/zshenv`
        ```sh
        export ZDOTDIR="$HOME/.config/zsh"
        export HISTFILE="$ZDOTDIR/.zsh_history"
        ```

2. clone repo inside `~/.config/yolk/` DON'T FORGET SUBMODULES

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
- [x] Comment every file with credits
- [x] Mako config
- [x] Kitty config
- [x] Wofi config
- [x] Starship config
- [x] Zsh config
- [ ] Gtk config
- [x] Cava config
- [ ] Hyprland
    - [x] Base config
    - [x] Clipboard management
    - [x] Emoji
    - [ ] Missing bspwm keybindings
    - [x] Screen lock
- [ ] Eww
    - [X] Tray
    - [x] Filler for main bar
    - [x] Refactor
    - [ ] Airplane mode
    - [ ] Calendar widget
    - [ ] Per-colorscheme icons
- [x] Gowall colorscheme
- [X] Bat colorscheme
- [X] Btop colorscheme
- [ ] Neovim colorscheme compatibility

## Acknowledgements

- [Lightly inspired by](https://github.com/gh0stzk/dotfiles)
- [some icons by Icons8](https://icons8.com)
