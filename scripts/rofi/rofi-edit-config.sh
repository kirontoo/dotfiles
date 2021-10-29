#!/bin/bash

declare -A LABELS
declare -A COMMANDS

function read_or_write() {
  read=$(echo "no
yes" | rofi -dmenu -p "Read Only?")

  [[ -z "$read" ]] && exit

  if [ "$read" == 'no' ]; then
    exec kitty -e nvim $HOME/$1
  else
    exec kitty -e nvim -R $HOME/$1
  fi
}

COMMANDS["bash"]=".bashrc"
COMMANDS["i3"]=".config/i3/config"
COMMANDS["polybar"]=".config/polybar/config"
COMMANDS["zsh"]=".zshrc"
COMMANDS["compton"]=".config/compton/config"
COMMANDS["rofi"]=".config/rofi/themes/embark.rasi"
COMMANDS["kitty"]=".config/kitty/kitty.conf"

LABELS["bash"]="edit .bashrc"
LABELS["i3"]="edit i3 config"
LABELS["kitty"]="edit kitty config"
LABELS["polybar"]="edit polybar theme"
LABELS["zsh"]="edit .zshrc"
LABELS["compton"]="edit compton"
LABELS["rofi"]="edit rofi theme"

function print_menu() {
  # sort alphabetically
  mapfile -d '' sorted < <(printf '%s\0' "${!LABELS[@]}" | sort -z)
  for key in ${!sorted[@]}  
  do
    # echo -e "${sorted[$key]}: ${LABELS[${sorted[$key]}]}"
    echo -e "${sorted[$key]}"
  done
}

function launch() {
  print_menu | rofi -dmenu -p "Edit Config" -theme $HOME/.config/rofi/embark-bar.rasi
}

value=$( launch )
selection=${value%%:\ *}
label=${value:$((${#selection}+1))}

[[ -z ${selection} ]] && exit

# check if selection exists
if test ${COMMANDS[$selection]+isset} 
then
  eval echo "Executing: ${COMMANDS[$selection]}"
  eval read_or_write ${COMMANDS[$selection]}
else
  # run an alternative command  eg. launch an app
  eval$(rofi -dmenu -theme $HOME/.config/rofi/prompt.rasi -p "Error: Run command")
fi

