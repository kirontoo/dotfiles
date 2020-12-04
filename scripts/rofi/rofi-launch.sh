#!/bin/bash

menu="$1"

if [ "$menu" = "autoscript" ]; then
    exec "~/scripts/rofi/rofi-autoscript.sh" 

elif [ "$menu" = "books" ]; then
    exec "~/scripts/rofi/rofi-books.sh" > /dev/null

elif [ "$menu" = "calculator" ]; then
    # rofi -modi "calculator:~/scripts/rofi/rofi-calculator.sh" -show calculator -show-icons -theme "$HOME/.config/rofi/simple-menu.rasi"
		rofi -show calc -modi calc -theme simple-menu -width 15 -lines 10 -no-show-match -no-sort -calc-command "echo -n '{result}' | xclip" > /dev/null

elif [ "$menu" = "config" ]; then
    exec "~/scripts/rofi/rofi-edit-config.sh" > /dev/null

elif [ "$menu" = "emoji" ]; then
    exec "~/scripts/rofi/rofi-emoji.sh" 

elif [ "$menu" = "icons" ]; then
    exec "~/scripts/rofi/rofi-icons" -f $HOME/scripts/icon_resources/icon-list.txt -o '-width 50 -lines 15 -bw 2 -columns 3 -i -markup-rows'

elif [ "$menu" = "keymap" ]; then
    exec "~/scripts/rofi/rofi-i3keymap.sh"

elif [ "$menu" = "network" ]; then
    networkmanager_dmenu &

elif [ "$menu" = "open" ]; then
		xdg-open "$(locate /  home  | rofi -theme simple-menu -threads 3 -width 50 -lines 15 -dmenu -i -p "locate:")"

elif [ "$menu" = "pidkill" ]; then
    exec "~/scripts/rofi/rofi-pidkill.sh" 

elif [ "$menu" = "powermenu" ]; then
    rofi -modi "Powermenu:~/scripts/rofi/rofi-powermenu.sh" -width 15 -lines 4 -show Powermenu -show-icons -theme simple-menu

elif [ "$menu" = "screenshot" ]; then
    exec "~/scripts/rofi/rofi-screenshot.sh" 

elif [ "$menu" = "screenshooter" ]; then
    exec "~/scripts/rofi/rofi-screenshooter.sh" 

elif [ "$menu" = "screenshooter-stop" ]; then
    exec "~/scripts/rofi/rofi-screenshooter.sh -s" 

elif [ "$menu" = "services" ]; then
    exec "~/scripts/rofi/rofi-run-services.sh" 

elif [ "$menu" = "surfraw" ]; then
    exec "~/scripts/rofi/rofi-surfraw.sh" 

elif [ "$menu" = "sysmon" ]; then
    exec "~/scripts/rofi/rofi-sysmon.sh" 

elif [ "$menu" = "tmux" ]; then
    exec "~/scripts/rofi/rofi-tmux-session.sh" 

elif [ "$menu" = "unicode" ]; then
    exec "~/scripts/rofi/rofi-icons" -f $HOME/scripts/icon_resources/unicode.txt -o '-width 50 -lines 15 -bw 2 -columns 3 -i -markup-rows'

elif [ "$menu" = "volume" ]; then
    exec "~/scripts/rofi/rofi-volume.sh" 
fi
