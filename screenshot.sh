#!/bin/bash 
rm ~/Pictures/screenshot.png
notify-send 'Select area'
scrot -s -e 'xclip -selection clipboard -target image/png -i $f' -F $HOME/Pictures/screenshot.png
notify-send 'Selection copied to clipboard'