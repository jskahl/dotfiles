#!/bin/sh

# Defines picom.conf path
picom="/home/j/.config/picom/picom.conf"
alacritty="/home/j/.config/alacritty/alacritty.toml"

# Uncomment active-opacity if it is commented in picom
if grep -q '^#active-opacity' "$file"; then
    sed -i 's/^#active-opacity/active-opacity/' "$file"

# Comment active-opacity if it is uncommented in picom
elif grep -q '^active-opacity' "$file"; then
    sed -i 's/^active-opacity/#active-opacity/' "$file"
fi

# Uncomment opacity if it is commented in alacritty
if grep -q '^#opacity' "$alacritty"; then
    sed -i 's/^#opacity/opacity/' "$alacritty"

# Comment opacity if it is uncommented in alacritty
elif grep -q '^opacity' "$alacritty"; then
    sed -i 's/^opacity/#opacity/' "$alacritty"
fi
