#!/bin/bash

players="$(playerctl -l | grep rhythmbox)"
if [ "$players" != "rhythmbox" ]; then
	exit 1;
fi

volume="$(playerctl -p rhythmbox volume)"
firstBit="$(echo $volume | cut -d \. -f1)"
secondBit="$(echo $volume | cut -d \. -f2 | cut -c 1-2)"
length="$(playerctl -p rhythmbox metadata mpris:length)"
seconds="$(expr $length / 1000000)"
minute="$(expr $seconds / 60)"
seconds="$(expr $seconds % 60)"
current="$(playerctl -p rhythmbox position | cut -d \. -f1)"
currMin="$(expr $current / 60)"
current="$(expr $current % 60)"

string="$currMin:$current/$minute:$seconds"

if [ "$firstBit" = 1 ]; then
	echo  100% $string 
elif [ "$firstBit" = 0 ]; then
	echo  $secondBit% $string 
fi
