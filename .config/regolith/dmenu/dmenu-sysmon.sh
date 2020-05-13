#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for launching system monitoring programs.


declare -a options=(" 
 gtop
 gotop
 htop
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

	if [ "$choice" == 'quit' ]; then
		echo "Program terminated."
	fi
	if [ $choice == 'htop' ]; then
        exec st -e htop
	fi
	if [ $choice == 'gtop' ]; then
        exec st -e gtop
	fi
	if [ $choice == 'gotop' ]; then
        exec st -e gotop
	fi
