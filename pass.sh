#!/bin/bash
db="/home/$USER/Documents/keepass.kdbx"
keyfile="/home/$USER/Documents/keepasskey"

banking=$(keepassxc-cli locate $db Oma --no-password --key-file $keyfile)
banking=${banking//'/Oma'/''}
options="$banking"

a=$(echo "$options" | rofi -font 'lato 18' -dmenu -i -p "Get password for")
ans="${a##*/}"
echo $ans
keepassxc-cli clip $db $ans --key-file $keyfile --no-password
