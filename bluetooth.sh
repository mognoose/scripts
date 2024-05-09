DEVICES=$(bluetoothctl devices | awk '{$1 = ""; $2 = ""; print $0";"}' )

DEVICE=$( echo ${DEVICES} | rofi -dmenu -sep ';' -font "lato 18" -i -p 'Select device:')

if [ -z "$DEVICE" ]
then
    echo "Program terminated." && exit 1
fi

ADDR=$(bluetoothctl devices | grep "$DEVICE" | sed 's/^ *//' | awk '{print $2}')

ACTION='disconnect'

STATUS=$(bluetoothctl info $ADDR | grep "Connected: yes")

if [ -z "$STATUS" ]
then
    ACTION='connect'
fi

RES=$(echo "Yes\nNo" | rofi -dmenu -font "lato 18" -i -p "Are you sure you want to $ACTION $DEVICE")

if [ $RES = "Yes" ]; then
    bluetoothctl $ACTION $ADDR
fi