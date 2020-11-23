#!/usr/bin/env bash
# see https://i3wm.org/docs/user-contributed/swapping-workspaces.html
# modified script taken from: https://gist.github.com/TitouanT/4dfb8c968f06965aaa875fcf6e837b3e
# requires jq
    
# stick_to="name" && cmd="workspace"      	# stick to the workspace
# # stick_to="output" && cmd="focus output" 	# stick to the screen
#
# initial=$(
# 	i3-msg -t get_workspaces |
# 	jq -r ".[] | select(.focused == true) | .$stick_to"
# )
#
# py_script=$(cat <<EOF
# import sys
# from numpy import roll
# s, w = [], []
# for l in sys.stdin.readlines():
# 	screen, workspace =  l.strip().split(':', 1)
# 	s.append(screen)
# 	w.append(workspace)
# for line in zip(s, roll(s,1), w, roll(w, -1)):
# 	print(' '.join(line))
# EOF
# )
#
# i3-msg -t get_outputs |
# jq -r '.[] | select(.active == true) | "\(.name):\(.current_workspace)"' |
# python3 -c "$py_script" |
# while read -r screen_src screen_dst workspace_tgt workspace_final
# do
# 	i3-msg -- workspace --no-auto-back-and-forth "$workspace_tgt"
# 	i3-msg move workspace to output "$screen_dst"
# 	i3-msg focus output "$screen_src"
# 	i3-msg -- workspace --no-auto-back-and-forth "$workspace_final"
# 	echo "moved $workspace_tgt to $screen_dst"
# 	echo "and restored focus to $workspace_final"
# done

# alternative script: https://gist.github.com/fbrinker/df9cfbc84511d807f45041737ff3ea02#gistcomment-3476857
INITIAL_WORKSPACE=$(i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2)

DISPLAY_CONFIG=($(i3-msg -t get_outputs | jq -r '.[]|"\(.name):\(.current_workspace)"'))

echo 'INITIAL_WORKSPACE: ' $INITIAL_WORKSPACE
echo 'DISPLAY_CONFIG: ' $DISPLAY_CONFIG

for ROW in "${DISPLAY_CONFIG[@]}"
do
	IFS=':'
	read -ra CONFIG <<< "${ROW}"
	if [ "${CONFIG[0]}" != "null" ] && [ "${CONFIG[1]}" != "null" ]; then
		echo "moving ${CONFIG[1]} right..."
		i3-msg -- workspace --no-auto-back-and-forth "${CONFIG[1]}"
		i3-msg -- move workspace to output right
	fi
done

# Focus on original workspace
i3-msg -- workspace --no-auto-back-and-forth $INITIAL_WORKSPACE
