#!/bin/bash
BROWSER="brave-browser"
SEARCH="https://www.google.com/search?q="
HOMEPAGE="https://csabaszilagyi.fi/start"
PAGES="Home
reddit.com
youtube.com
twitch.tv
twitter.com
instagram.com
facebook.com
messenger.com
wikipedia.org
beta.protonmail.com
calendar.google.com"

PAGE=$(echo "$PAGES" | rofi -font 'lato 18' -dmenu -i -p "")
echo $PAGE

if [[ $PAGE == "Home" ]]; then
    $BROWSER $HOMEPAGE
    echo "Homepage opened"
elif [[ $PAGE == *"."* ]]; then
    $BROWSER $PAGE
    echo "bookmark opened"
elif [ "$PAGE" ]; then
    $BROWSER "$SEARCH$PAGE"
    echo "search initiated"
else
    echo "Program terminated. $PAGE" && exit 1
fi