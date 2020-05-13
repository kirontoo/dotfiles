#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for editing some of my more frequently edited config files.


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
        exec st -e nvim $HOME/.bashrc
  fi
	if [ $choice == 'i3' ]; then
        exec st -e nvim $HOME/.config/regolith/i3/config
	fi
	if [ $choice == 'polybar' ]; then
        exec st -e nvim $HOME/.config/regolith/polybar/config
	fi
	if [ $choice == 'zsh' ]; then
        exec st -e nvim $HOME/.zshrc
	fi
	if [ $choice == 'compton' ]; then
        exec st -e nvim $HOME/.config/regolith/compton/config
	fi
	if [ $choice == 'rofi' ]; then
        exec st -e nvim $HOME/.config/regolith/rofi/custom.rasi
	fi
	if [ $choice == 'conky' ]; then
        exec st -e nvim $HOME/.config/regolith/conky/system-overview
	fi
	if [ $choice == 'Xresources' ]; then
        exec st -e nvim $HOME/.Xresources-regolith
	fi
