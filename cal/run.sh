#!/bin/bash
MEET=$(node $HOME/.scripts/cal/index.js | rofi -dmenu -font "lato 18" -i -p "Join meeting")
URL=$(cut -d "|" -f3 <<< $MEET)

# What to do when/if we choose 'quit'.
if [[ "$URL" == "quit" ]]; then
    echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$URL" ]; then
    google-chrome --new-window $URL

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 1
fi
