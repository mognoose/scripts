#!/bin/bash

dir="/mnt/fileserver"

db="/home/$USER/Documents/keepass.kdbx"
keyfile="/home/$USER/Documents/keepasskey"
entry="NAS-Dashboard"

#Get password from Keepass
pass=$(keepassxc-cli show -sa password $db $entry --key-file $keyfile --no-password)

#Create mount dir if it does not exist
[[ -d "$dir" ]] || { echo "Dir not found...creating $dir"; sudo mkdir "$dir"; sudo chmod +rwx "$dir"; sudo chown $USER:$USER $dir;}

#mount nas
sshfs -o password_stdin admin@sapatti.synology.me:/ $dir <<< $pass
