#!/bin/bash

APP=$(pacmd list-sink-inputs | tr '\n' '\r' | perl -pe 's/.*? *index: ([0-9]+).+?application\.name = "([^\r]+)"\r.+?(?=index:|$)/\2:\1\r/g' | tr '\r' '\n' | rofi -font 'lato 18' -dmenu -i -p "Select App:")

SINKINPUT=$(echo $APP | sed 's/.*://')

echo $SINKINPUT

SINK=$(pacmd list-sinks | tr '\n' '\r' | perl -pe 's/.*? *index: ([0-9]+).+?device\.product\.name = "([^\r]+)"\r.+?(?=index:|$)/\2:\1\r/g' | tr '\r' '\n' | rofi -font 'lato 18' -dmenu -i -p "Select Audio:")

SINKID=$(echo $SINK | sed 's/.*://')

echo "pactl move-sink-input $SINKINPUT $SINKID"

pactl move-sink-input $SINKINPUT $SINKID
