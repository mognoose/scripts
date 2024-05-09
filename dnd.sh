
paused=$(dunstctl is-paused)

if $paused; then
    echo "󰂛."
fi

case $BLOCK_BUTTON in
1) dunstctl set-paused toggle
esac