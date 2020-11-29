#!/bin/bash

selected=$(ls "$HOME/scripts" | rofi -dmenu -width 15 -lines 10 -p "autoscript")
[[ -z $selected ]] && exit
$HOME/scripts/autoscript $selected true &
