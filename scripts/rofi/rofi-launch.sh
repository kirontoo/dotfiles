#!/bin/bash

menu="$1"

if [ "$menu" = "powermenu" ]; then
    rofi -modi 'Powermenu:~/scripts/rofi/rofi-powermenu.sh' -show Powermenu -show-icons -theme '.config/rofi/simple-menu.rasi'
fi
