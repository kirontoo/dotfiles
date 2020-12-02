#! /usr/bin/env bash
# modified from source: https://github.com/davatorium/rofi-scripts/blob/master/tmux_session.sh

function tmux_sessions()
{
    tmux list-session -F '#S'
}

attached=$( tmux display -p '#{session_name}' )
TMUX_SESSION=$( (echo 'new'; tmux_sessions) | rofi -dmenu -p "Select tmux session" -width 15 -lines $( expr $( tmux list-session -F '#S' | wc -l ) + 1))

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
		session_name=$( rofi -dmenu -p "Session Name?" -theme '.config/rofi/prompt.rasi' )
		[[ -z "${session_name}" ]] && exit
		rofi-sensible-terminal --name tmux_${session_name} --title ${session_name} -e tmux new -t $session_name &
elif [[ -z "${TMUX_SESSION}" ]]; then
		exit
else
    rofi-sensible-terminal --name tmux_${TMUX_SESSION} --title ${TMUX_SESSION} -e tmux attach -t "${TMUX_SESSION}" &
fi
