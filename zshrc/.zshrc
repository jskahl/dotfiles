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
alias neofetch='neofetch --source ~/.config/neofetch/asciis/knight.txt'
alias shutdown='poweroff'
alias financial="sc-im ~/financial/2025/setembro.sc"
alias theme="~/scripts/theme.sh"
alias work="~/scripts/work.sh"
alias class="~/scripts/class.sh"
alias toggle-opacity="/home/j/scripts/opacity-toggle.sh"
alias rmdir="rm -rf"
#alias glance="glance --config ~/.config/glance/glance.yml"
alias ls="lsd"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Created by `pipx` on 2025-10-22 20:51:57
export PATH="$PATH:/home/j/.local/bin"
