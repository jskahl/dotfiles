#!/bin/bash

# Find .desktop files
desktop_files=$(
    printf "%s:" "$XDG_DATA_HOME" $XDG_DATA_DIRS | \
    tr ':' '\n' | \
    awk NF | \
    sed 's#$#/applications#' | \
    xargs -I {} bash -c '[ -d "{}" ] && find "{}" -name "*.desktop"'
)

# Parse desktop entries
choices=$(
    while IFS= read -r file; do
        name=$(grep -m1 '^Name=' "$file" | cut -d= -f2-)
        exec=$(grep -m1 '^Exec=' "$file" | cut -d= -f2- | sed 's/ *%[A-Za-z]//g')
        nodisplay=$(grep -m1 '^NoDisplay=' "$file" | cut -d= -f2-)
        hidden=$(grep -m1 '^Hidden=' "$file" | cut -d= -f2-)

        [[ "$hidden" == "true" ]] && continue
        [[ "$nodisplay" == "true" ]] && continue
        [[ -z "$name" ]] && continue
        [[ -z "$exec" ]] && continue

        printf "%s\t%s\n" "$name" "$exec"
    done <<< "$desktop_files"
)

# Let the user pick (append RPG entry properly)
choice=$(
    printf "%s\n%s\n" "$choices" "RPG Map Editor" | \
    cut -f1 | \
    "$HOME/scripts/dmenu/dmenu.sh" \
        -l 10 \
        -c
)

# Special case
if [[ "$choice" == "RPG Map Editor" ]]; then
    cd /home/j/.local/src/rpgmap
    wine rpgmap.exe
    return 0
fi

# Run the corresponding command
cmd=$(
    printf "%s\n" "$choices" | \
    awk -F'\t' -v c="$choice" '$1 == c {print $2}'
)

[[ -n "$cmd" ]] && eval "$cmd" &

