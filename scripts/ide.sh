#!/bin/bash
tmux split-window -v -p 30 -c "#{pane_current_path}"
tmux split-window -h -p 40 -c "#{pane_current_path}"
