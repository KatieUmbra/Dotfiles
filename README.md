# Kathy's Dotfiles

## Instalation

1. get files
    - create `.config/yolk/`
    - clone repository inside `git clone --recurse-submodules -j8 git://github.com/KatieUmbra/Dotfiles ~/.config/yolk`

2. install deps `yay -S < DEPENDENCIES`
    - add lines to `/etc/zsh/zshenv`
        ```sh
        export ZDOTDIR="$HOME/.config/zsh"
        export HISTFILE="$ZDOTDIR/.zsh_history"
        ```

3. run `yolk sync`

4. change GTK settings using `nwg-look`
    - Theme: WhiteSur-Light-Purple
    - Font: Work Sans Regular 12
    - Icons: Numix Circle
    - Cursor: Bibata Modern Ice

5. change QT settings using `kvantum`
    - Theme: WhiteSur

6. **OPTIONAL** display managers are bloat, check the `tty` folder

## Roadmap

- [ ] Vanity
    - [ ] Collect wallpapers for each colorscheme and use gowall
    - [ ] Create showcase gifs for each colorscheme (inspired by [gh0stzk](https://github.com/gh0stzk/dotfiles))
    - [ ] Missing comment credits
- [ ] Eww
    - [x] Tray
    - [x] Filler for main bar
    - [x] Refactor
    - [x] Calendar widget
    - [x] Per-colorscheme icons
    - [ ] Cheatsheet
- [ ] Colorscheme
    - [x] Nord
    - [x] Catpuccin
    - [ ] Nightfox
    - [ ] Solarized
    - [ ] OneDark
- [x] Collect and list all dependencies
- [x] Comment every file with credits
- [x] Mako config
- [x] Kitty config
- [x] Wofi config
- [x] Starship config
- [x] Zsh config
- [x] Cava config
- [x] Hyprland
    - [x] Base config
    - [x] Clipboard management
    - [x] Emoji
    - [x] Screen lock
    - [x] Showcase mode
    - [x] Missing bspwm utilities
- [x] Gowall colorscheme
- [x] Bat colorscheme
- [x] Btop colorscheme
- [x] Neovim colorscheme compatibility

## Acknowledgements

- [Lightly inspired by](https://github.com/gh0stzk/dotfiles)
- [Icons heavily based on icons8](https://icons8.com)
