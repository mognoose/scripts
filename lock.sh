#!/bin/bash
# /usr/bin/blurlock

# take screenshot
#import -window root /tmp/screenshot.png

# blur it
#convert /home/csaba/Pictures/wallpapers/purple-nebula-wallpaper2k.jpg -scale 2560x1440 /tmp/lock.png
#rm /tmp/screenshot.png

bg=$(grep file -m 1 $HOME/.config/nitrogen/bg-saved.cfg | cut -d '=' -f2)
res=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
convert $bg -resize $res^ -gravity center -extent $res /tmp/lock.png

# lock the screen
i3lock -c 121212 -i /tmp/lock.png #-f -c '#000000' -o '#191d0f' -w '572020' -l '#ffffff' -e

# sleep 1 adds a small delay to prevent possible race conditions with suspend
sleep 1

exit 0
