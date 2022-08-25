#!/bin/bash
DEFAULT="google-chrome"
SEARCH="https://www.google.com/search?q="
HOMEPAGE="https://google.com"
declare -a BROWSERS
BROWSERS=("google-chrome" "brave-browser" "firefox")
BROWSERSNAMES="Chrome
Brave
Firefox"
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
	BROWSERINDEX=$(echo "$BROWSERSNAMES" | rofi -font 'lato 18' -dmenu -i -p "Browser:" -format i)
    BROWSER=${BROWSERS[$BROWSERINDEX]}
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