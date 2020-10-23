#!/usr/bin/env bash

# Taken from: https://www.reddit.com/r/unixporn/comments/7df2wz/i3lock_minimal_lockscreen_pretty_indicator/

# Enable picom's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
# dbus-send --print-reply --dest=com.github.chjj.picom.${DISPLAY/:/_} / \
#     com.github.chjj.picom.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in picom's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.picom.${DISPLAY/:/_} / \
#     com.github.chjj.picom.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst
i3lock -n -i $HOME/Pictures/minimal/resized.png \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1300" \
    --radius=15 --veriftext="" --wrongtext=""
pkill -u $USER -USR2 dunst

# Revert picom's config changes.
sleep 0.2
# dbus-send --print-reply --dest=com.github.chjj.picom.${DISPLAY/:/_} / \
#     com.github.chjj.picom.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.picom.${DISPLAY/:/_} / \
#     com.github.chjj.picom.opts_set string:unredir_if_possible boolean:true
