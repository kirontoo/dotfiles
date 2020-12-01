#!/bin/bash

declare -A LABELS
declare -A COMMANDS

SCRIPT_DIR="$HOME/scripts"
ROFI_DIR="$SCRIPT_DIR/rofi"

COMMANDS["autoscript"]="$ROFI_DIR/rofi-launch.sh autoscript"
LABELS["autoscript"]="Edit or create a script"

COMMANDS["books"]="$ROFI_DIR/rofi-launch.sh books"
LABELS["books"]="Open a book ( pdf/epub )"

COMMANDS["calculator"]="$ROFI_DIR/rofi-launch.sh calculator"
LABELS["calculator"]="An interactive calculator"

COMMANDS["config"]="$ROFI_DIR/rofi-launch.sh config"
LABELS["config"]="Edit config files"

COMMANDS["emoji"]="$ROFI_DIR/rofi-launch.sh emoji"
LABELS["emoji"]="Search through emojis"

COMMANDS["icons"]="$ROFI_DIR/rofi-launch.sh icons"
LABELS["icons"]="Search through font awesome icons"

COMMANDS["keymap"]="$ROFI_DIR/rofi-launch.sh keymap"
LABELS["keymap"]="View or execute i3 keymappings"

COMMANDS["network"]="$ROFI_DIR/rofi-launch.sh network"
LABELS["network"]="Network Manager"

COMMANDS["open"]="$ROFI_DIR/rofi-launch.sh open"
LABELS["open"]="Search and open a file"

COMMANDS["pidkill"]="$ROFI_DIR/rofi-launch.sh pidkill"
LABELS["pidkill"]="Kill a process"

COMMANDS["powermenu"]="$ROFI_DIR/rofi-launch.sh powermenu"
LABELS["powermenu"]="Open powermenu"

COMMANDS["screenshot"]="$ROFI_DIR/rofi-launch.sh screenshot"
LABELS["screenshot"]="Make a screenshot"

COMMANDS["services"]="$ROFI_DIR/rofi-launch.sh services"
LABELS["services"]="Run a service"

COMMANDS["sysmon"]="$ROFI_DIR/rofi-launch.sh sysmon"
LABELS["sysmon"]="Run a system monitor application"

COMMANDS["tmux"]="$ROFI_DIR/rofi-launch.sh tmux"
LABELS["tmux"]="Open TMUX session"

COMMANDS["unicode"]="$ROFI_DIR/rofi-launch.sh unicode"
LABELS["unicode"]="Search through unicode"

COMMANDS["volume"]="$ROFI_DIR/rofi-launch.sh volume"
LABELS["volume"]="Adjust volume"

function print_menu() {
	
	# sort alphabetically
	mapfile -d '' sorted < <(printf '%s\0' "${!LABELS[@]}" | sort -z)
	for key in ${!sorted[@]}	
	do
		echo -e "${sorted[$key]}: ${LABELS[${sorted[$key]}]}"
	done
}

function launch() {
	print_menu | rofi -dmenu -width 20 -mesg "Launch Rofi Menu" -i -p "Menu"
}

value=$( launch )
selection=${value%%:\ *}
label=${value:$((${#selection}+1))}

[[ -z ${selection} ]] && exit

# check if selection exists
if test ${COMMANDS[$selection]+isset} 
then
	eval echo "Executing: ${COMMANDS[$selection]}"
	eval ${COMMANDS[$selection]}
else
	# run an alternative command  eg. launch an app
	eval$(rofi -dmenu -theme $HOME/.config/rofi/prompt.rasi -p "Error: Run command")
fi

