#!/bin/sh


# Function found in https://github.com/dylanaraps/pure-bash-bible
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

action=$(
    printf "%s\n" \
    " New note" " Existing note" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -l 10 \
    -c
)

t=$(trim_all "$action")
[ -z "$t" ] && exit 0

create_note() {
    new_note=$(
    printf "%s\n" \
    " Idea" " Task" " Random" " Journal" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -l 10 \
    -p "Create note:" \
    -c
    )

    t=$(trim_all "$new_note")
    [ -z "$t" ] && exit 0

    timestamp=$(date +"%d/%m/%Y-%a")
    case "$new_note" in
        " Idea") i3-msg 'exec alacritty -e nvim $HOME/notes/ideas.md; floating enable'  ;;
        " Task") i3-msg 'exec alacritty -e nvim $HOME/notes/tasks.md; floating enable' ;;
        " Journal") i3-msg 'exec alacritty -e nvim $HOME/notes/$(timestamp).md; floating enable' ;;
    *) exit 0 ;;
    esac

}

existing_note() {
    selected_note=$(
        ls "$HOME/notes" |
        $HOME/scripts/dmenu/dmenu.sh \
        -l 10 \
        -p "Select note:" \
        -c
    )

    t=$(trim_all "$selected_note")
    [ -z "$t" ] && exit 0

    alacritty -e nvim "$HOME/notes/$selected_note"
}


case "$action" in
    " Existing note") existing_note ;;
    " New note") create_note ;;
esac

