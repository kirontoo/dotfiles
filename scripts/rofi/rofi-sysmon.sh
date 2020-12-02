#!/bin/bash

choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor" -width 15 -lines 5)
if [ "$choice" == 'htop' ]; then
	kitty --name htop -e htop
if [ "$choice" == 'gtop' ]; then
	kitty --name gtop -e gtop
elif [ "$choice" == 'gotop' ]; then
	kitty --name gotop -e gotop 
elif [ "$choice" == 'iftop' ]; then
	kitty --name iftop -e sudo iftop
elif [ "$choice" == 'bashtop' ]; then
	kitty --name bashtop -e bashtop
elif [ "$choice" == 'bandwhich' ]; then
	kitty --name bandwhich -e sudo bandwhich
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install ${choice} first."
fi
