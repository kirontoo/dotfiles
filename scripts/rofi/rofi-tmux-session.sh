#! /usr/bin/env bash
# modified from source: https://github.com/davatorium/rofi-scripts/blob/master/tmux_session.sh

function tmux_sessions()
{
    tmux list-session -F '#S'
}

attached=$( tmux display -p '#{session_name}' )
TMUX_SESSION=$( (echo 'new'; tmux_sessions) | rofi -dmenu -p "Select tmux session" -width 15 -lines $( expr $( tmux list-session -F '#S' | wc -l ) + 1))

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
    rofi-sensible-terminal -e tmux new-session &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    rofi-sensible-terminal -e tmux attach -t "${TMUX_SESSION}" &
fi
