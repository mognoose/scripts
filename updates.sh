#!/bin/bash
UPDATE="sudo apt upgrade -y "
SELECTED="$(apt list --upgradable | sed 's/Listing.../Update All/g' | awk -F'/' '{print $1}' | rofi -dmenu -font "lato 18" -i -p Update:)"

if [[ $SELECTED == "Update All" ]]; then
    $UPDATE
    echo "Updated All"
elif [ "$SELECTED" ]; then
    $UPDATE$SELECTED
    echo "app upgraded"
else
    echo "Program terminated. $SELECTED" && exit 1
fi

pkill -SIGRTMIN+10 i3blocks