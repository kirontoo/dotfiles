#!/bin/bash


choice=$(echo "gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor")
	if [ $choice == 'htop' ]; then
    echo $choice
        exec st -e htop
	fi
	if [ $choice == 'gtop' ]; then
        exec st -e gtop
	fi
	if [ $choice == 'gotop' ]; then
        exec st -e gotop 
	fi
	if [ $choice == 'ifton' ]; then
        exec st -e ifton 
	fi
