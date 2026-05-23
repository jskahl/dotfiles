#!/usr/bin/env bash

IS_MONITOR_CONNECTED=$(cat "$HOME/.cache/isMonitorConnected")

if $IS_MONITOR_CONNECTED == "true"; then
    hyprctl keyword monitor "eDP-1, disable"    
    echo "false" > "$HOME/.cache/isMonitorConnected"
else
    hyprctl keyword monitor "eDP-1, enable"    
    echo "true" > "$HOME/.cache/isMonitorConnected"
fi
