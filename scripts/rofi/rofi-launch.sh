#!/bin/bash

menu="$1"

if [ "$menu" = "calculator" ]; then
    # rofi -modi "calculator:~/scripts/rofi/rofi-calculator.sh" -show calculator -show-icons -theme "$HOME/.config/rofi/simple-menu.rasi"
		rofi -show calc -modi calc -width 15 -lines 10 -no-show-match -no-sort -calc-command "echo -n '{result}' | xclip" > /dev/null

elif [ "$menu" = "config" ]; then
    exec "~/scripts/rofi/rofi-edit-config.sh" > /dev/null

elif [ "$menu" = "books" ]; then
    exec "~/scripts/rofi/rofi-books.sh" > /dev/null

elif [ "$menu" = "icons" ]; then
    exec "~/scripts/rofi/rofi-icons" -f $HOME/scripts/icon_resources/icon-list.txt -o '-width 50 -lines 15 -bw 2 -columns 3 -i -markup-rows'

elif [ "$menu" = "unicode" ]; then
    exec "~/scripts/rofi/rofi-icons" -f $HOME/scripts/icon_resources/unicode.txt -o '-width 50 -lines 15 -bw 2 -columns 3 -i -markup-rows'

elif [ "$menu" = "emoji" ]; then
    exec "~/scripts/rofi/rofi-emoji.sh" 

elif [ "$menu" = "autoscript" ]; then
    exec "~/scripts/rofi/rofi-autoscript.sh" 

elif [ "$menu" = "network" ]; then
    networkmanager_dmenu &

elif [ "$menu" = "powermenu" ]; then
    rofi -modi "Powermenu:~/scripts/rofi/rofi-powermenu.sh" -width 15 -lines 4 -show Powermenu -show-icons -theme "$HOME/.config/rofi/simple-menu.rasi"

elif [ "$menu" = "screenshot" ]; then
    exec "~/scripts/rofi/rofi-screenshot.sh" 

elif [ "$menu" = "services" ]; then
    exec "~/scripts/rofi/rofi-run-services.sh" 

elif [ "$menu" = "sysmon" ]; then
    exec "~/scripts/rofi/rofi-sysmon.sh" 

elif [ "$menu" = "tmux" ]; then
    exec "~/scripts/rofi/rofi-tmux-session.sh" 

elif [ "$menu" = "volume" ]; then
    exec "~/scripts/rofi/rofi-volume.sh" 
fi
