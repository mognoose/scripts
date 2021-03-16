#!/bin/bash
cpu=$(perl $HOME/.scripts/cpu_usage | head -1)
mem=$(free -m | awk 'NR==2{printf "%.0f%", ($3)/($2)*100 }')
dsk=$(df | awk 'NR==4{printf "%.0f%", $5}')
#spd=$(sh /opt/speedtest.sh)
all=" $cpu $mem  $dsk"

echo ""

if [ $BLOCK_BUTTON = 1 ]
then
notify-send -t 2 -u critical " "$cpu"  "$mem"  "$dsk
fi
exit 0
