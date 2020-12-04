#!/bin/bash

selected=$(ls "$HOME/scripts" | rofi -dmenu -p "autoscript")
[[ -z $selected ]] && exit
$HOME/scripts/autoscript $selected true &
