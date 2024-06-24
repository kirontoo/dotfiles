#!/bin/bash
# This script will search through system processes and kill them

pid_col=1

if [[ $(uname) = Linux ]]; then
	pid_col=2
elif [[ $(uname) = Darwin ]]; then
	pid_col=3;
else
	echo 'Error: unknown platform'
	return
fi

pids=$( ps -f -u $USER | sed 1d | tofi --prompt-text "kill: " | tr -s [:blank:] | cut -d' ' -f"$pid_col" )

[[ -z $pids ]] && exit

if [[ -n $pids ]]; then
	echo "$pids" | xargs kill -9 "$@"
fi
