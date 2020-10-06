#!/bin/bash


choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "Syalacrittyem Monitor")
	if [ $choice == 'htop' ]; then
    echo $choice
        exec alacritty -e htop
	fi
	if [ $choice == 'gtop' ]; then
        exec alacritty -e gtop
	fi
	if [ $choice == 'gotop' ]; then
        exec alacritty -e gotop 
	fi
	if [ $choice == 'ifton' ]; then
        exec alacritty -e ifton 
	fi
	if [ $choices == 'bashtop' ]; then
				exec alacritty -e bashtop
