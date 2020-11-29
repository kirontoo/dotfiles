#!/bin/bash

choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor" -width 15 -lines 5)
	if [ "$choice" == 'htop' ]; then
        kitty -e htop
	fi
	if [ "$choice" == 'gtop' ]; then
        kitty -e gtop
	fi
	if [ "$choice" == 'gotop' ]; then
        kitty -e gotop 
	fi
	if [ "$choice" == 'iftop' ]; then
        kitty -e iftop
	fi
	if [ "$choice" == 'bashtop' ]; then
				kitty -e bashtop
	fi
