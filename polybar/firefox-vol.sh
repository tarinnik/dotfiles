#!/bin/bash

volume="$(playerctl -p plasma-browser-integration volume)"
players="$(playerctl -l | grep plasma)"
firstBit="$(echo $volume | cut -d \. -f1)"
secondBit="$(echo $volume | cut -d \. -f2 | cut -c 1-2)"

if [ "$players" != "plasma-browser-integration" ]; then
	exit 1;
elif [ "$firstBit" = 1 ]; then
	echo '100'
elif [ "$firstBit" = 0 ]; then
	echo $secondBit
fi
