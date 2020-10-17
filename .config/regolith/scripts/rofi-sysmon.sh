#!/bin/bash


choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor")
	if [ $choice == 'htop' ]; then
        exec kitty -e htop
	fi
	if [ $choice == 'gtop' ]; then
        exec kitty -e gtop
	fi
	if [ $choice == 'gotop' ]; then
        exec kitty -e gotop 
	fi
	if [ $choice == 'iftop' ]; then
        exec kitty -e iftop
	fi
	if [ $choice == 'bashtop' ]; then
				exec kitty -e bashtop
