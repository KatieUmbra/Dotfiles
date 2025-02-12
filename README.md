# Kathy's Dotfiles

## Showcase

### Rose Pine

![moon](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/rosepine-moon.gif?raw=true)
![dawn](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/rosepine-dawn.gif?raw=true)
![default](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/rosepine-default.gif?raw=true)

### Catppuccin

![latte](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/catppuccin-latte.gif?raw=true)
![frappe](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/catppuccin-frappe.gif?raw=true)
![macchiato](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/catppuccin-macchiato.gif?raw=true)
![mocha](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/catppuccin-mocha.gif?raw=true)

### Nord

![default](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/nord-default.gif?raw=true)

## Preparation

1. Have a clean install of artix linux
2. Make sure arch repositories are enabled

## Instalation

1. get files
    - create `.config/yolk/`
    - clone repository inside `git clone --recurse-submodules -j8 git://github.com/KatieUmbra/Dotfiles ~/.config/yolk`

2. install deps `yay -S - < DEPENDENCIES`

3. add lines to `/etc/zsh/zshenv`
    ```sh
    export ZDOTDIR="$HOME/.config/zsh"
    export HISTFILE="$ZDOTDIR/.zsh_history"
    ```

4. run `yolk sync`

5. change GTK settings using `nwg-look`
    - Theme: WhiteSur-Light-Purple
    - Font: Work Sans Regular 12
    - Icons: Numix Circle
    - Cursor: Bibata Modern Ice

6. change QT settings using `kvantum`
    - Theme: WhiteSur

7. **OPTIONAL** display managers are bloat, check the `tty` folder

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
