#!/bin/bash
BROWSER="brave-browser"
PAGES="
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
$BROWSER $PAGE