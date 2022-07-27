#!/bin/bash
MEET=$(node $HOME/.scripts/calnode/index.js | rofi -dmenu -font "lato 18" -i -p "Join meeting")
URL=$(cut -d "|" -f3 <<<$MEET)

if [ "$URL" ]; then
    google-chrome --new-window $URL
else
    echo "Program terminated." && exit 1
fi
