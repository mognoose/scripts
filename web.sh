#!/bin/bash
BROWSER="brave-browser"
SEARCH="https://www.google.com/search?q"
PAGES="csabaszilagyi.fi/start
beta.protonmail.com
calendar.google.com
youtube.com
twitch.tv
reddit.com
instagram.com
twitter.com
facebook.com
messenger.com
wikipedia.org"
PAGE=$(echo "$PAGES" | rofi -font 'lato 18' -dmenu -i -p "WEB:")

if [[ $PAGE == *"."* ]]; then
    $BROWSER $PAGE
    echo "page opened"
elif [ "$PAGE" ]; then
    $BROWSER "$SEARCH=$PAGE"
else
    echo "Program terminated. $PAGE" && exit 1
fi