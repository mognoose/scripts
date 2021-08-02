#!/bin/bash

if [ -x "$(command -v dunstify)" ]; then
    NOTIFIER="dunstify -r 4 "
else
    NOTIFIER="notify-send"
fi

$NOTIFIER "Getting updates"
sudo apt update

UPDATE="sudo apt upgrade -y "
SELECTED="$(apt list --upgradable | sed 's/Listing.../Update All/g' | awk -F'/' '{print $1}' | rofi -dmenu -font "lato 18" -i -p Update:)"

if [[ $SELECTED == "Update All" ]]; then
    $NOTIFIER "Updating all"
    $UPDATE
elif [ "$SELECTED" ]; then
    $NOTIFIER "Updating $SELECTED"
    $UPDATE$SELECTED
else
    echo "Program terminated. $SELECTED" && exit 1
fi

sudo pkill -SIGRTMIN+10 i3blocks
$NOTIFIER "Update done"