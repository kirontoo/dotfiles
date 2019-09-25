#!/bin/bash

read_or_write() {
  read=$(echo "no
yes" | rofi -dmenu -p "Read Only?")

  if [ $read == 'no' ]; then
    exec st -e nvim $HOME/$1
  else
    exec st -e nvim -R $HOME/$1
  fi
}

choice=$(echo "bash
compton
conky
i3
polybar
rofi
scripts
Xresources
zsh
" | rofi -dmenu -p "Select Config")

if [ $choice == 'bash' ]; then
      read_or_write '.bashrc'
fi
if [ $choice == 'i3' ]; then
      read_or_write '.config/regolith/i3/config'
fi
if [ $choice == 'polybar' ]; then
      read_or_write '.config/polybar/config'
fi
if [ $choice == 'zsh' ]; then
      read_or_write '.zshrc'
fi
if [ $choice == 'compton' ]; then
      read_or_write '.config/regolith/compton/config'
fi
if [ $choice == 'rofi' ]; then
      read_or_write '.config/regolith/rofi/custom.rasi'
fi
if [ $choice == 'conky' ]; then
      read_or_write '.config/regolith/conky/system-overview'
fi
if [ $choice == 'Xresources' ]; then
      read_or_write '.Xresources-regolith'
fi

if [ $choice == 'scripts' ]; then
    file=$(echo "edit-config
sysmon
surfraw" | rofi -dmenu -p "Select Script")

    if [ $file == 'edit-config' ]; then
      read_or_write '.config/regolith/scripts/rofi-edit-config.sh'
    fi
    if [ $file == 'sysmon' ]; then
      read_or_write '.config/regolith/scripts/rofi-sysmon.sh'
    fi
    if [ $file == 'surfraw' ]; then
      read_or_write '.config/regolith/scripts/rofi-surfraw.sh'
    fi
fi

