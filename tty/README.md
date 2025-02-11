# Alternative to DM

> [!WARNING]
> YOU MUST BE USING OPENRC FOR THIS TO WORK

I made this little openrc service and `issue` file because no DM worked nicely with hyprland, you're welcome to try `greetd` or `gdm` if you want, or if you use artix you can use this little package to have a cute looking tty login, the zsh config automatically starts hyprland anyways so it'll go away automatically :p

## Instalation

### DEPENDENCIES

1. Install `setcolors-git` from the AUR

### STEPS

1. copy `colors` (the one without a file type) into `/etc/init.d/` 
2. copy `color.sh` (the one with a file type) into `/usr/local/bin/`
3. replace/copy `issue` into `/etc/issue`
4. run the command `sudo rc-update add colors`
5. restart your computer

## Acknowledgements

the pixel art was made using [pxltrm](https://github.com/Crestwave/pxltrm)

the character is KAngel/OMGKawaiiAngel from the game **NEEDY STREAMER OVERLOAD**
