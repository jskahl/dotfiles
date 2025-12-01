#!/bin/sh

cd ~/documents/projects/occupy/occupy-frontend
clear
echo ""
echo "To work!"
echo ""
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
i3-msg 'unmark keep' \
        > /dev/null

###################################
# Execute all necessary processes #
###################################

# Execute firefox and open tabs
i3-msg "workspace 2; \
        exec firefox \
        http://localhost:5173 \
        http://localhost:8101" \
        > /dev/null

# Execute working shell
i3-msg "workspace 3; \
        exec alacritty \
        --working-directory ~/documents/projects/occupy/occupy-frontend" \
        > /dev/null

# Execute dev shell
i3-msg "workspace 3; \
        exec alacritty \
        --working-directory ~/documents/projects/occupy/occupy-frontend \
        -e zsh -c 'npm run dev -- --host 0.0.0.0'" > /dev/null

# Execute nchat
i3-msg "workspace 5; \
        exec alacritty \
        -e zsh -c 'nchat'" \
        > /dev/null

# Goes back to WS1
i3-msg "workspace 1" \
        > /dev/null
