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
# Description: zsh shell config file
# Dependencies:
# - https://github.com/zsh-users/zsh-syntax-highlighting
# - https://github.com/zsh-users/zsh-autosuggestions
# - https://github.com/agkozak/zsh-z
# - https://github.com/hlissner/zsh-autopair

# [[ Zsh Settings ]]
# =============

# Editor
export EDITOR='nvim'

# Aliases
alias vim="nvim"
alias v="nvim"
alias nv="nvim"
alias ls="lsd"
alias cat="bat"
alias top="btop"
alias htop="btop"
alias bashtop="btop"
alias fetch="fastfetch"
alias neofetch="fastfetch"
alias clock="tty-clock -c -t -r -D -C 5"

# Disable Vim Mode
bindkey -e
# =============


# [[ Plugins ]]
# =============

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

PLUGINS="$HOME/.config/zsh/plugins"

# Syntax Highlighting
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

# Frequent Folders
export ZSHZ_DATA="$HOME/.config/zsh/.z_data"
source $PLUGINS/zsh-z/zsh-z.plugin.zsh

# Auto Pairs
source $PLUGINS/zsh-autopair/zsh-autopair.plugin.zsh

autopair-init

# =============
# [[ Customization ]]
# =============

# Highlight tab
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# History
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Bun Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# =============
# [[ Environment Variables ]]
# =============

# Local binary
export PATH="$PATH:$HOME/.bin"

# C / C++ Compiler
export CC=clang
export CXX=clang++

# Pipx
export PATH="$PATH:$HOME/.local/bin"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export GOPATH="$HOME/.go"

# Spicetify
export PATH="$PATH:/home/Kathy/.spicetify"

# =============
# Extension Scripts
# =============

# source $ZDOTDIR/ssh_agent.sh

# =============
