#!/bin/sh

calc="$(
    printf "%s" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -p "Enter calc: " \
    -l 0 \
    -b \
)"

# Function found in https://github.com/dylanaraps/pure-bash-bible
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

trimmed_calc=$(trim_all "$calc")
if [ -z "$trimmed_calc" ]; then
    exit 0
fi

result=$(calc "$calc" | sed 's/^\t//')

notify-send -t 1000 "Result:" "$result"
