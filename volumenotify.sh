#!bin/bash

vol=$(amixer -c 1 -M -D pulse get Master | awk {'print $5'} | grep -m 1 %)
vol=$(echo "$vol" | tr -d "[]%")
icon=audio-volume-mute

#if [ $vol -ge 66 ]
#then
#icon=audio-volume-high
#elif [ $vol -lt 66 ]
#then
#icon=audio-volume-medium
#elif [ $vol -lt 33 ]
#then
#icon=audio-volume-low
#else
#icon=audio-volume-medium
#fi

dunstify -i audio-volume-low "$vol"% -r 3
#echo "$vol"
