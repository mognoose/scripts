np=$(playerctl --player spotify metadata --format '{{ artist }} - {{ title }}')
status=$(playerctl --player spotify metadata --format '{{ status }}' | sed 's/Playing//g; s/Paused//g')
echo $status $np
