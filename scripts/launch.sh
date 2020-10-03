#!/bin/bash

menu="$1"

if [ "$menu" = "powermenu" ]; then
    rofi -modi 'Powermenu:~/scripts/rofi-powermenu.sh' -show Powermenu -theme '.config/regolith/rofi/embark'
fi
