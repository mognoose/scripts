#!/usr/bin/env sh
monitors=($(xrandr --listmonitors | awk '{ print $4 }'))
i=11

x=$(xdpyinfo | grep "dimensions" | awk '{ print $2 }' | awk -F 'x' '{ print $1}')
y=$(xdpyinfo | grep "dimensions" | awk '{ print $2 }' | awk -F 'x' '{ print $2}')
if i3-msg -t get_tree | grep -Fq '"class":"i3bar"'; then
    for monitor in "${monitors[@]}"
    do
        i=$(($i+1))
        i3-msg "workspace $i, move workspace to output $monitor, workspace 1"
    done
    i3-msg "workspace 1, workspace 21"

    # i3-msg "workspace 13, move workspace to output eDP-1, workspace 1, workspace 14, move workspace to output DP-2-2, workspace 1, workspace 11"
    xdotool mousemove $x $y
    i3-msg bar mode invisible
    i3-msg mode "lock"
    dunstctl set-paused true
    conky
else
    xdotool mousemove $(($x/2)) $(($y/2))
    # i3-msg "workspace back_and_forth"
    i3-msg "workspace 9, workspace 2, workspace 1"
    i3-msg bar mode dock
    i3-msg mode "default"
    dunstctl set-paused false
    killall conky
fi
exit 1
