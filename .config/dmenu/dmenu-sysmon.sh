#!/bin/bash


declare -a options=(" 
 gtop
 gotop
 htop
 bashtop
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

	if [ "$choice" == 'quit' ]; then
		echo "Program terminated."
	fi
	if [ $choice == 'htop' ]; then
        exec kitty -e htop
	fi
	if [ $choice == 'gtop' ]; then
        exec kitty -e gtop
	fi
	if [ $choice == 'gotop' ]; then
        exec kitty -e gotop
	fi
	if [ $choice == 'bashtop' ]; then
        exec kitty -e bashtop
	fi
