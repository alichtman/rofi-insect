#!/usr/bin/env bash

# Rofi integration for insect (https://github.com/sharkdp/insect)
# Copying to the clipboard requires xsel

usage() {
    echo "$(tput bold)rofi-insect calculator$(tput sgr0)
An insect (fancy calculator that does unit conversions) plugin for Rofi or dmenu

This script supports (almost) anything insect does.
The previous result is ALWAYS passed as the first argument

$(tput bold)############
# KNOWN BUGS:
############$(tput sgr0)

0. Hit Clear if results start not making sense.
1. Crashes if \`-NUMBER\` is entered after an expression has been calculated.
     Reproduce with: 500 + 50 [ENTER] -4
2. 500 [ENTER] 500 + 400 [ENTER] results in the wrong answer. For some reason, the first 500 isn't being cleared properly. idk.
"
    exit
}

######
# MAIN
######


case "$1" in
    -h|-help|--help|help) usage ;;
esac

# Path to menu application
if [[ -n $(command -v rofi) ]]; then
    menu="$(command -v rofi) -dmenu"
elif [[ -n $(command -v dmenu) ]]; then
    menu="$(command -v dmenu)"
else
    echo >&2 "Rofi or dmenu not found"
    exit
fi

input="$*"
answer=$(echo "$input" | insect)
action=$(echo -e "Copy to clipboard\nClear\nClose" | $menu -i -p "$input = $answer") # Check out $ man dmenu for an explanation these options

case $action in
    "Clear") $0 ;;
    "Copy to clipboard") echo -n "$input = $answer" | awk '{$1=$1};1' | xsel -ib ;; # The awk expression trims whitespace: https://unix.stackexchange.com/a/205854/321263
    "Close") ;;
    "") ;;
    *) $0 "$answer $action" ;;
esac
