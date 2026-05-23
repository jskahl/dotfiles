#!/bin/bash


# Check if hyprsunset is currently active
if pgrep -x "hyprsunset" > /dev/null
then
    # If active, stop hyprsunset to disable the blue light filter
    pkill hyprsunset
else
    # If not active, start hyprsunset to enable the blue light filter
    hyprsunset -t 3000
fi
