#! /usr/bin/env bash
# modified from source: https://github.com/davatorium/rofi-scripts/blob/master/tmux_session.sh

function tmux_sessions()
{
    tmux list-session -F '#S'
}

attached=$( tmux display -p '#{session_name}' )
TMUX_SESSION=$( (echo 'new'; echo 'kill'; tmux_sessions) | rofi -dmenu -p "Select tmux session" -width 15 -lines $( expr $( tmux list-session -F '#S' | wc -l ) + 1))

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
		# create a new tmux session
		session_name=$( rofi -dmenu -p "Session Name?" )
		[[ -z "${session_name}" ]] && exit
		i3run -i tmux_${TMUX_SESSION} -e "i3-sensible-terminal --name tmux_${session_name} --title ${session_name} -e tmux new -t '${session_name}'" &

elif [[ x"kill" = x"${TMUX_SESSION}" ]]; then
		TMUX_SESSION=$( ( tmux_sessions) | rofi -dmenu -p "Select tmux session" -width 15 -lines $( expr $( tmux list-session -F '#S' | wc -l ) + 1))
		tmux kill-session -t ${TMUX_SESSION} 

elif [[ -z "${TMUX_SESSION}" ]]; then
		exit
else
		# attach to a session
    i3run -i tmux_${TMUX_SESSION} -e "i3-sensible-terminal --name tmux_${TMUX_SESSION} --title ${TMUX_SESSION} -e tmux attach -t '${TMUX_SESSION}'" &
fi

exit
