np=$(playerctl metadata --format '{{ artist }} - {{ title }}')
status=$(playerctl metadata --format '{{ status }}' | sed 's/Playing//g; s/Paused//g')
echo $status $np
case $BLOCK_BUTTON in
    1) playerctl play-pause ;;
    4) playerctl next ;;
    5) playerctl previous ;;
esac
