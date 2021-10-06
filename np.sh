np=$(playerctl --player spotify metadata --format '{{ artist }} - {{ title }}')
status=$(playerctl --player spotify metadata --format '{{ status }}' | sed 's/Playing//g; s/Paused//g')
echo $status $np
case $BLOCK_BUTTON in
    1) playerctl --player spotify play-pause ;;
    4) playerctl --player spotify next ;;
    5) playerctl --player spotify previous ;;
esac