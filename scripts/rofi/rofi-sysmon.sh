#!/bin/bash

choice=$(echo "bashtop
gtop
gotop
htop
iftop" | rofi -dmenu -p "System Monitor" -width 15 -lines 5)
if [ "$choice" == 'htop' ]; then
	i3-sensible-terminal --detach -o font_size=10 -o window_margin_width=0 --name htop -e htop &
elif [ "$choice" == 'gtop' ]; then
	i3-sensible-terminal --detach -o font_size=8 -o window_margin_width=0 -o window_padding_width=0 --name gtop -e gtop
elif [ "$choice" == 'gotop' ]; then
	i3-sensible-terminal --detach -o font_size=10 -o window_margin_width=0 --name gotop -e gotop &
elif [ "$choice" == 'iftop' ]; then
	i3-sensible-terminal --detach -o font_size=10 -o window_margin_width=0 --name iftop -e iftop &
elif [ "$choice" == 'bashtop' ]; then
	i3-sensible-terminal --detach -o font_size=8 -o window_margin_width=0 -o window_padding_width=0 --name bashtop -e bashtop &
elif [ "$choice" == 'bandwhich' ]; then
	i3-sensible-terminal --detach -o font_size=10 -o window_margin_width=0 --name bandwhich -e bandwhich &
elif [[ -z ${choice} ]]; then
	exit
else
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install ${choice} first."
fi
