#!/bin/bash
cpu=$(perl $HOME/.scripts/cpu_usage | head -1)
mem=$(free -m | awk 'NR==2{printf "%.0f%", ($3)/($2)*100 }')
dsk=$(df | awk 'NR==4{printf "%.0f%", $5}')

notify-send " "$cpu"  "$mem"  "$dsk
