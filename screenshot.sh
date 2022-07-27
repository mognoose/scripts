#!/bin/bash 
notify-send 'Select area'
scrot -s -e 'xclip -selection clipboard -target image/png -i $f'
notify-send 'Selection copied to clipboard'