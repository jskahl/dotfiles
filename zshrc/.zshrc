############################
#           zsh            #
#          config          #
############################

export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
    zsh-nvm-lazy-load 
)

source $ZSH/oh-my-zsh.sh

# Aliases
    # Substitute commands
    alias neofetch="neofetch --source '$HOME/.config/neofetch/asciis/knight.txt'"
    alias shutdown="poweroff"
    alias rmdir="rm -rf"
    alias ls="lsd"
    alias copilot="copilot --banner"

    # Scripts commands
    alias theme="$HOME/scripts/theme.sh"
    alias work="$HOME/scripts/work.sh"
    alias class="$HOME/scripts/class.sh"
    alias toggle-opacity="$HOME/scripts/opacity-toggle.sh"
    alias dmusic="$HOME/scripts/download-music.sh"
    alias swpp="$HOME/scripts/set-wallpaper.sh"

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Created by `pipx` on 2025-10-22 20:51:57
export PATH="$PATH:/home/j/.local/bin"
