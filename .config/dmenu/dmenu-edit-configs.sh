#!/bin/bash


declare -a options=("
 bash
 compton
 conky
 i3
 polybar
 rofi
 Xresources
 zsh
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -i -p 'Edit a config file: ')

	if [ "$choice" == ' quit ' ]; then
		echo "Program terminated."
  fi
	if [ $choice == 'bash' ]; then
        exec kitty -e nvim $HOME/.bashrc
  fi
	if [ $choice == 'i3' ]; then
        exec kitty -e nvim $HOME/.config/regolith/i3/config
	fi
	if [ $choice == 'polybar' ]; then
        exec kitty -e nvim $HOME/.config/polybar/config
	fi
	if [ $choice == 'zsh' ]; then
        exec kitty -e nvim $HOME/.zshrc
	fi
	if [ $choice == 'compton' ]; then
        exec kitty -e nvim $HOME/.config/regolith/compton/config
	fi
	if [ $choice == 'rofi' ]; then
        exec kitty -e nvim $HOME/.config/rofi/themes/embark.rasi
	fi
	if [ $choice == 'Xresources' ]; then
        exec kitty -e nvim $HOME/.Xresources-regolith
	fi
