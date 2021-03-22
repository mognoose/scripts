#!/bin/bash

if [ -x "$(command -v dunstify)" ]; then
    NOTIFIER="dunstify -r 4 "
else
    NOTIFIER="notify-send"
fi

$NOTIFIER "updating"
sudo apt update && sudo apt upgrade -y && pkill -SIGRTMIN+10 i3blocks
$NOTIFIER "update done"

