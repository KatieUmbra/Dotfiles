<div align="center">

# Kathy's Dotfiles
![Main image](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/main.png?raw=true)

</div>

## Instalation

### Preinstall steps

1. Have a clean install of artix linux
2. Make sure arch repositories are enabled

### Install

1. get files
    - create `.config/yolk/`
    - clone repository inside `git clone --recurse-submodules -j8 git://github.com/KatieUmbra/Dotfiles ~/.config/yolk`

2. install deps `yay -S - < DEPENDENCIES`

3. add lines to `/etc/zsh/zshenv`
    ```sh
    export ZDOTDIR="$HOME/.config/zsh"
    export HISTFILE="$ZDOTDIR/.zsh_history"
    ```

4. run `sudo ln -s /usr/bin/kitty /usr/bin/gnome-terminal` for wofi terminal apps

6. install a couple python dependencies for eww script
- Navigate to `$HOME/.config/yolk/eggs/eww/scripts/`
- run `$ uv venv`
- activate the virtual environment `$ source .venv/bin/activate`
- install watchdog `$ uv pip install watchdog`
- install resettabletimer `$ uv pip install resettabletimer`

5. run `yolk sync`

### Post install

1. change GTK settings using `nwg-look`
    - Theme: WhiteSur-Light-Purple
    - Font: Work Sans Regular 12
    - Icons: Numix Circle
    - Cursor: Bibata Modern Ice

2. change QT settings using `kvantum`
    - Theme: WhiteSur

3. install yazi plugins
    - `cd ~/.config/yazi`
    - `ya pack -i`

4. **OPTIONAL** display managers are bloat, check the `tty` folder

## Showcase

<div align="center">

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

### Login screen
![login screen](https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/assets/showcase/login.png?raw=true)

</div>

## Configuration

All the config files are available inside `~/.config/yolk`

1. Main config file `~/.config/yolk/yolk.rhai`
    - To change the colorscheme change the field `data.color`
      ```rhai
      export const data = ${
          color: colors::colorschemes.{THEME}.{VARIANT},
          ...
      }
      ```
      check the showcases section to see all the possible options, or look inside `colors.rhai`

    - To change the wallpaper type change the field `data.wallpaper_type`, the options are `weeb`, `plain`, `landscape`
      ```rhai
      export const data = #{
          ...
          wallpaper_type: "weeb",
          ...
      }
      ```

    - The rest of options are pretty self explaining, good luck ;)

## Roadmap

- [x] Vanity
    - [x] Nice looking readme
    - [x] Collect wallpapers for each colorscheme
    - [x] Create showcase gifs for each colorscheme (inspired by [gh0stzk](https://github.com/gh0stzk/dotfiles))
    - [x] Missing comment credits
- [ ] Eww
    - [x] Tray
    - [x] Filler for main bar
    - [x] Refactor
    - [x] Calendar widget
    - [x] Per-colorscheme icons
    - [ ] Volume key popup
    - [ ] Cheatsheet
    - [ ] System information window
        - [ ] Ram
        - [ ] Disk
        - [ ] Delatiled battery
        - [ ] Cpu
        - [ ] Graphs
        - [ ] Username
        - [ ] User face
        - [ ] Pacman updates
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
- [x] Niri
    - [x] Base config
    - [x] Clipboard management
    - [x] Emoji
    - [x] Screen lock
    - [ ] Showcase mode
    - [x] Missing bspwm utilities
- [x] Gowall colorscheme
- [x] Bat colorscheme
- [x] Btop colorscheme
- [x] Neovim colorscheme compatibility
- [ ] Volume key sounds

## Acknowledgements

- [Lightly inspired by](https://github.com/gh0stzk/dotfiles)
- [Icons heavily based on icons8](https://icons8.com)
