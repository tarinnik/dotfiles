#!/bin/bash

hyprctl monitors -j | jq -c ".[$1].activeWorkspace.id"
