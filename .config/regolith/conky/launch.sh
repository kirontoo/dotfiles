#!/usr/bin/env bash

# Terminate already running conky instances
killall -q conky

# Wait until the processes have been shut down
while pgrep -u $UID -x conky >/dev/null; do sleep 1; done

conky -q -c ~/.config/regolith/conky/system-overview
conky -q -c ~/.config/regolith/conky/task-progress.lua

echo "conky launched..."
