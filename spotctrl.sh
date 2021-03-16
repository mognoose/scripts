#!/bin/bash
status="$(playerctl --player spotify status)"
play=
pause=

if [ "$status" = "Playing" ]
then
play=$pause
fi

if [ "$status" = "" ]
then
full_text=""
else
case "$1" in
"play-pause") full_text=$play;;
"previous") full_text="";;
"next") full_text="";;
esac
fi
echo $full_text
if [ $BLOCK_BUTTON = 1 ]
then
playerctl --player spotify "$1"
fi
exit 0
