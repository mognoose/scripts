battery=/sys/class/power_supply/BAT0/
capacity=$(cat "$battery"/capacity)
status=$(cat "$battery"/status)

#plugged=
charging=
full=
high=
half=
low=
empty=

if [ $capacity -gt 75 ]
then
icon=$full

elif [ $capacity -gt 50 -a $capacity -lt 75 ]
then
icon=$high

elif [ $capacity -lt 50 -a $capacity -gt 25 ]
then
icon=$half

elif [ $capacity -gt 25 -a $capacity -lt 50 ]
then
icon=$low

elif [ $capacity -lt 25 ]
then
icon=$empty
fi

if [ $status = "Charging" ]
then
echo $charging $capacity"%"

elif [ "$status" = "Discharging" ] 
then
echo $icon $capacity"%"

fi
