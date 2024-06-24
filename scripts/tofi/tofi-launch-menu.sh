#!/bin/bash

declare -A LABELS
declare -A COMMANDS

SCRIPT_DIR="$HOME/scripts"
tofi_DIR="$SCRIPT_DIR/tofi"

COMMANDS["autoscript"]="$tofi_DIR/tofi-launch.sh autoscript"
LABELS["autoscript"]="Edit or create a script"

COMMANDS["bluetooth"]="$tofi_DIR/tofi-launch.sh bluetooth"
LABELS["bluetooth"]="Open bluetooth list"

COMMANDS["books"]="$tofi_DIR/tofi-launch.sh books"
LABELS["books"]="Open a book ( pdf/epub )"

COMMANDS["config"]="$tofi_DIR/tofi-launch.sh config"
LABELS["config"]="Edit config files"

COMMANDS["pidkill"]="$tofi_DIR/tofi-launch.sh pidkill"
LABELS["pidkill"]="Kill a process"

COMMANDS["screenshot"]="$tofi_DIR/tofi-launch.sh screenshot"
LABELS["screenshot"]="Make a screenshot"

COMMANDS["screenshooter"]="$tofi_DIR/tofi-launch.sh screenshooter"
LABELS["screenshooter"]="Make a screenshot or record"

COMMANDS["screenshooter-stop"]="$tofi_DIR/tofi-launch.sh screenshooter-stop"
LABELS["screenshooter-stop"]="End screenshooter recording"

COMMANDS["services"]="$tofi_DIR/tofi-launch.sh services"
LABELS["services"]="Run a service"

COMMANDS["sysmon"]="$tofi_DIR/tofi-launch.sh sysmon"
LABELS["sysmon"]="Run a system monitor application"

COMMANDS["tmux"]="$tofi_DIR/tofi-launch.sh tmux"
LABELS["tmux"]="Open TMUX session"

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
	print_menu | tofi --prompt-text "Menu: " 
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
	eval$(tofi-drun -p "Error: Run command")
fi

