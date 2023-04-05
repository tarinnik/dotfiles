#!/bin/bash

players="$(playerctl -l | grep ncspot)"
if [ "$players" != "ncspot" ]; then
	exit 1;
fi

volume="$(playerctl -p ncspot volume)"
firstBit="$(echo $volume | cut -d \. -f1)"
secondBit="$(echo $volume | cut -d \. -f2 | cut -c 1-2)"
length="$(playerctl -p ncspot metadata mpris:length)"
seconds="$(expr $length / 1000000)"
minute="$(expr $seconds / 60)"
seconds="$(expr $seconds % 60)"
seconds="$(printf %02d $seconds)"
current="$(playerctl -p ncspot position | cut -d \. -f1)"
currMin="$(expr $current / 60)"
current="$(expr $current % 60)"
current="$(printf %02d $current)"
title="$(playerctl -p ncspot metadata xesam:title)"
artist="$(playerctl -p ncspot metadata xesam:artist)"

string="$title - $artist $currMin:$current/$minute:$seconds"

if [ "$firstBit" = 1 ]; then
	echo  100% $string 
elif [ "$firstBit" = 0 ]; then
	echo  $secondBit% $string 
fi
