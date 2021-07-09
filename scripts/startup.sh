#!/bin/bash

i3-sensible-terminal --detach --name schedule -e nvim -c VimwikiDiaryIndex
exec $HOME/scripts/tmux-dev > /dev/null 2>&1
