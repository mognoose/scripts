#!/bin/bash
db="/home/$USER/Documents/keepass.kdbx"
keyfile="/home/$USER/Documents/keepasskey"

options=$(keepassxc-cli locate $db / --no-password --key-file $keyfile)

a=$(echo "$options" | rofi -font 'lato 18' -dmenu -i -p "Get password for")
ans="${a##*/}"
echo $ans
keepassxc-cli clip $db $ans --key-file $keyfile --no-password
