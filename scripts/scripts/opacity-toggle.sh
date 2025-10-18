#!/bin/sh

# Defines picom.conf path
file="/home/j/.config/picom/picom.conf"

# Uncomment active-opacity if it is commented
if grep -q '^#active-opacity' "$file"; then
    sed -i 's/^#active-opacity/active-opacity/' "$file"

# Comment active-opacity if it is uncommented
elif grep -q '^active-opacity' "$file"; then
    sed -i 's/^active-opacity/#active-opacity/' "$file"
fi
