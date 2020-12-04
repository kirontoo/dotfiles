#!/bin/bash

read_or_write() {
  read=$(echo "no
yes" | rofi -dmenu -p "Read Only?")
	
	[[ -z "$read" ]] && exit

  if [ "$read" == 'no' ]; then
    exec kitty -e nvim $HOME/$1
  else
    exec kitty -e nvim -R $HOME/$1
  fi
}

choice=$(echo "bash
compton
conky
i3
polybar
rofi
scripts
zsh
" | rofi -dmenu -width 15 -lines 8 -p "Edit Config")

if [ "$choice" == 'bash' ]; then
      read_or_write '.bashrc'
fi
if [ "$choice" == 'i3' ]; then
      read_or_write '.config/i3/config'
fi
if [ "$choice" == 'polybar' ]; then
      read_or_write '.config/polybar/config'
fi
if [ "$choice" == 'zsh' ]; then
      read_or_write '.zshrc'
fi
if [ "$choice" == 'compton' ]; then
      read_or_write '.config/compton/config'
fi
if [ "$choice" == 'rofi' ]; then
      read_or_write '.config/rofi/themes/embark.rasi'
fi
if [ "$choice" == 'conky' ]; then
      read_or_write '.config/conky/system-overview'
fi

if [ "$choice" == 'scripts' ]; then
    file=$(echo "edit-config
sysmon
surfraw" | rofi -dmenu -width 15 -lines 3 -p "Select Script")

    if [ "$file" == 'edit-config' ]; then
      read_or_write '.config/scripts/rofi/rofi-edit-config.sh'
    fi
    if [ "$file" == 'sysmon' ]; then
      read_or_write '.config/scripts/rofi/rofi-sysmon.sh'
    fi
    if [ "$file" == 'surfraw' ]; then
      read_or_write '.config/scripts/rofi/rofi-surfraw.sh'
    fi
fi

