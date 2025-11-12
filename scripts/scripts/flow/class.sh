#!/bin/sh

clear
echo "To study!"
motivate


########################
# Clean all workspaces #
########################

# Mark current window as "keep"
i3-msg '[con_id=__focused__] mark keep' > /dev/null

# Delete all windows but the "keep" window
for id in $(i3-msg -t get_tree | jq '.. | select(.id? and .window?) | select(.marks? | index("keep") | not) | .id'); do
    i3-msg "[con_id=$id] kill" > /dev/null 
done

# Unmark the current window
i3-msg "unmark keep" \
        > /dev/null

################
# Open windows #
################


# Open firefox
i3-msg "workspace 1; \
        exec firefox \
        https://sig.ifc.edu.br/sigaa/verTelaLogin.do \
        https://classroom.google.com \
        https://scholar.google.com/?hl=pt-BR \
        https://www.overleaf.com/" \
        > /dev/null

# # Open notes
# i3-msg "workspace 2; \
#         exec alacritty -e zsh -c \
#         'nvim \
#         +"cd ~/notes/" .'" \
#         > /dev/null

# Open shell
i3-msg "workspace 3; \
        exec alacritty -e zsh -c \
        'exec zsh'" \
        > /dev/null

# Open nchat
i3-msg "workspace 5; \
        exec alacritty -e zsh -c \
        'nchat'" \
        > /dev/null

# Goes back to WS1
i3-msg "workspace 1" \
        > /dev/null
