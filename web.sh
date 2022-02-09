#!/bin/bash
DEFAULT="google-chrome"
SEARCH="https://www.google.com/search?q="
HOMEPAGE="https://google.com"
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

if [ -z $1 ]; then
	BROWSER=$DEFAULT
else
	BROWSER=$1
fi

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