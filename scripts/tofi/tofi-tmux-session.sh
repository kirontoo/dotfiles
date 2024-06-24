#! /usr/bin/env bash
# modified from source: https://github.com/davatorium/rofi-scripts/blob/master/tmux_session.sh

source /etc/profile

function tmux_sessions()
{
    tmux list-sessions -F '#S'
}

# attached=$( tmux display --prompt-text '#{session_name}' )
# TMUX_SESSION=$( (echo 'new'; echo 'kill'; tmux_sessions) | tofi --prompt-text "Select tmux session" $( expr $( tmux list-session -F '#S' | wc -l ) + 1))
TMUX_SESSION=$( (echo 'new'; echo 'kill'; tmux_sessions) | tofi --prompt-text "Select tmux session: " --require-match false)
# TMUX_SESSION = 

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
    # create a new tmux session
    session_name=$( (tmux_sessions ) | tofi --prompt-text "Session Name? " --require-match false)
    [[ -z "${session_name}" ]] && exit
    exec kitty --name tmux_${session_name} --title ${session_name} -e tmux new -s ${session_name} &

elif [[ x"kill" = x"${TMUX_SESSION}" ]]; then
    KILL_SESSION=$( (tmux_sessions) | tofi --prompt-text "Session to kill: " --require-match false)
    tmux kill-session -t ${KILL_SESSION} 

elif [[ -z "${TMUX_SESSION}" ]]; then
    exit
else
    # attach to a session
    exec kitty --name tmux_${TMUX_SESSION} --title ${TMUX_SESSION} -e tmux attach -t ${TMUX_SESSION} &
fi

exit 0
