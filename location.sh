#!/bin/bash

if[$1 == 'home']
then
	$l = 653627
else
	$l = 666666
fi

sudo sed -i '/CITY_ID=/c\CITY_ID='$l /usr/share/i3blocks/weather
echo "Location changed: " $l
