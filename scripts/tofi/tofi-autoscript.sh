#!/bin/bash

selected=$(ls "$HOME/scripts" | tofi --prompt-text "autoscript: " --require-match false)
[[ -z $selected ]] && exit
$HOME/scripts/autoscript $selected false &
