#!/bin/bash
DEFAULT="google-chrome"
SEARCH="https://www.google.com/search?q="
HOMEPAGE="https://google.com"
declare -a BROWSERS
BROWSERSNAMES

if google-chrome --version &> /dev/null
then
    BROWSERS+=("google-chrome")
    BROWSERSNAMES+=("Chrome,")

fi

if brave-browser --version &> /dev/null
then
    BROWSERS+=("brave-browser")
    BROWSERSNAMES+="Brave,"
fi

if firefox --version &> /dev/null
then
    BROWSERS+=("firefox")
    BROWSERSNAMES+="Firefox,"
fi

if qutebrowser --version &> /dev/null
then
    BROWSERS+=("qutebrowser")
    BROWSERSNAMES+="Qutebrowser"
fi

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
	BROWSERINDEX=$(echo $BROWSERSNAMES | rofi -font 'lato 18' -dmenu -i -p "Browser:" -format i -sep ',')
    BROWSER=${BROWSERS[$BROWSERINDEX]}
else
	BROWSER=$1
fi

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
