#!/bin/bash

hyprctl workspaces -j | jq -c "[.[] | select(.monitor == \"$1\") | .id]"
