#!/bin/bash

choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor" -width 15 -lines 5)
if [ "$choice" == 'htop' ]; then
	kitty --name htop -e htop
fi
if [ "$choice" == 'gtop' ]; then
	kitty --name gtop -e gtop
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'gtop' first."
fi
if [ "$choice" == 'gotop' ]; then
	kitty --name gotop -e gotop 
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'gotop' first."
fi
if [ "$choice" == 'iftop' ]; then
	kitty --name iftop -e sudo iftop
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'iftop' first."
fi
if [ "$choice" == 'bashtop' ]; then
	kitty --name bashtop -e bashtop
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'bashtop' first."
fi
if [ "$choice" == 'bandwhich' ]; then
	kitty --name bandwhich -e sudo bandwhich
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'bandwhich' first."
fi
