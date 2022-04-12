#!/bin/bash 
dunstify -r 4 'Select area'
scrot -s -e 'xclip -selection clipboard -target image/png -i $f'
dunstify -r 4 'Selection copied to clipboard'