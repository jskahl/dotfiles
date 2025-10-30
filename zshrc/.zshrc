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

    # Abreviations
        alias neofetch='neofetch --source ~/.config/neofetch/asciis/knight.txt'
        alias shutdown='poweroff'
        alias rmdir="rm -rf"
        alias ls="lsd"
        alias financial="sc-im ~/financial/2025/setembro.sc"

    # Scripts 
        alias toggle-opacity="/home/j/scripts/opacity-toggle.sh"
        alias theme="~/scripts/theme.sh"
        alias work="~/scripts/work.sh"
        alias class="~/scripts/class.sh"
        alias dwld-music="sudo /home/j/scripts/download-music.sh"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Created by `pipx` on 2025-10-22 20:51:57
export PATH="$PATH:/home/j/.local/bin"
