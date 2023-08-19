#!/bin/bash

~/.config/eww/scripts/get_active_workspace.sh $1
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 grep '^workspace' | while read -r line; do
    ~/.config/eww/scripts/get_active_workspace.sh $1
done
