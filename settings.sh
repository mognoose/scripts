#!/bin/bash
cmd="pacmd set-card-profile alsa_card.pci-0000_00_1f.3 output:"
options="audio\nkeyboard"
jack="analog-stereo"
hdmi="hdmi-stereo"

a=$(echo "$options" | rofi -font 'lato 18' -dmenu -i -p "Settings")

if [ $a = "audio" ]
then
	sh "/home/$USER/.scripts/audioswitcher.sh"
	#$cmd$jack
elif [ $a = "hdmi" ]
then
	$cmd$hdmi
fi
