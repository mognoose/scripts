#!/bin/bash

TYPES="sentences
paragraphs"

if [ $# -eq 0 ]
  then
    TYPE=$(echo "$TYPES" | rofi -font 'lato 18' -dmenu -i -p "Type")
    WORDS=$(rofi -font 'lato 18' -dmenu -i -p "How many?")
  else
    WORDS=$2
    TYPE="sentences"
    if [ "${1}" = "2" ]; then
        TYPE="paragraphs"
    fi
fi

curl -s http://metaphorpsum.com/"$TYPE"/"$WORDS" | xclip -selection c
