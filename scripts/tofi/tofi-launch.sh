#!/bin/bash

menu="$1"

if [ "$menu" = "autoscript" ]; then
    exec "~/scripts/tofi/tofi-autoscript.sh" 

elif [ "$menu" = "bluetooth" ]; then
    exec "~/scripts/tofi/tofi-bluetooth.sh" > /dev/null

elif [ "$menu" = "books" ]; then
    exec "~/scripts/tofi/tofi-books.sh" > /dev/null

elif [ "$menu" = "config" ]; then
    exec "~/scripts/tofi/tofi-edit-config.sh" > /dev/null

elif [ "$menu" = "pidkill" ]; then
    exec "~/scripts/tofi/tofi-pidkill.sh" 

elif [ "$menu" = "screenshot" ]; then
    exec "~/scripts/tofi/tofi-screenshot.sh" 

elif [ "$menu" = "screenshooter" ]; then
    exec "~/scripts/tofi/tofi-screenshooter.sh" 

elif [ "$menu" = "screenshooter-stop" ]; then
    $HOME/scripts/tofi/tofi-screenshooter.sh --stop 

elif [ "$menu" = "services" ]; then
    exec "~/scripts/tofi/tofi-run-services.sh" 

elif [ "$menu" = "sysmon" ]; then
    exec "~/scripts/tofi/tofi-sysmon.sh" 

elif [ "$menu" = "tmux" ]; then
    exec "~/scripts/tofi/tofi-tmux-session.sh" 
fi
