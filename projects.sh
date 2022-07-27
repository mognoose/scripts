#!/usr/bin/env bash

EDITOR="code"
TERMINAL="kitty"

projects=$(ls -d $HOME/Projects/*/ | awk -F '/' '{print $5}')

choice=$(printf '%s\n' "${projects[@]}" | rofi -dmenu -font "lato 18" -i -p 'Open Project:')

echo $choice

if [ "$choice" ]; then
    $EDITOR "$HOME/Projects/$choice" && $TERMINAL " -1 -d $HOME/Projects/$choice"

else
    echo "Program terminated." && exit 1
fi