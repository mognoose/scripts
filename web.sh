#!/bin/bash
#BROWSER="brave-browser"
BROWSER="firefox-nightly"
SEARCH="https://www.google.com/search?q="
HOMEPAGE="https://csabaszilagyi.fi/start"
PAGES="Home
reddit.com
youtube.com
twitch.tv
wikipedia.org
nettiauto.com
twitter.com
instagram.com
facebook.com
messenger.com
beta.protonmail.com
calendar.google.com"

PAGE=$(echo "$PAGES" | rofi -font 'lato 18' -dmenu -i -p "")
echo $PAGE

if [[ $PAGE == "Home" ]]; then
    $BROWSER
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
