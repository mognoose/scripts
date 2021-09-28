#!/bin/bash
db="/home/$USER/Documents/keepass.kdbx"
keyfile="/home/$USER/Documents/keepasskey"
path="Oma/Codetag/vpn/"

if [ $# -eq 0 ]
  then
    options=$(nmcli connection show | grep vpn | awk '{ print $1 }')
    ans=$(echo "$options" | rofi -font 'lato 18' -dmenu -i -p "VPN")
  else
    ans=$1
fi

con="down"
status=$(nmcli -f GENERAL.STATE connection show $ans)

if [[ -z $status ]]
  then
    con="up"
fi

entry="$path$ans"
pass=$(keepassxc-cli show -a Password $db $entry --key-file $keyfile --no-password)
nmcli connection $con $ans --ask <<< $pass%   