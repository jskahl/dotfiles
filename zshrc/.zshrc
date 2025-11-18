############################
#           zsh            #
#          config          #
############################


zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt appendhistory
setopt incappendhistory
setopt sharehistory
setopt histignoredups


bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Aliases

    # Substitions
    alias neofetch="neofetch --source '$HOME/.config/neofetch/asciis/knight.txt'"
    alias shutdown="poweroff"
    alias rmdir="rm -rf"
    alias ls="lsd"
    alias copilot="copilot --banner"
    alias dmenu="$HOME/scripts/dmenu/dmenu.sh"

    # Scripts commands
    alias theme="$HOME/scripts/theme/theme.sh"
    alias work="$HOME/scripts/flow/work.sh"
    alias class="$HOME/scripts/flow/class.sh"
    alias toggle-opacity="$HOME/scripts/flow/opacity-toggle.sh"
    alias dmusic="$HOME/scripts/download-music.sh"
    alias swpp="$HOME/scripts/theme/set-wallpaper.sh"
    alias ai-search="$HOME/scripts/search-with-ai.sh"


# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Created by `pipx` on 2025-10-22 20:51:57
export PATH="$PATH:/home/j/.local/bin"

# bun completions
[ -s "/home/j/.bun/_bun" ] && source "/home/j/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# --- Plugins (order matters!) ---
source ~/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/src/zsh-nvm-lazy-load/zsh-nvm-lazy-load.plugin.zsh
source ~/.local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
