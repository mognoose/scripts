#!/bin/bash
dunstify "updating" -r 4
sudo apt update && sudo apt upgrade -y && pkill -SIGRTMIN+10 i3blocks
dunstify "update done" -r 4

