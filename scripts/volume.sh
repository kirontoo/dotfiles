#!/bin/bash

# modified from source: https://github.com/dastorm/volume-notification-dunst

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
	amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
	amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

function send_notification {
	DIR=`dirname "$0"`
	volume=`get_volume`
	# Make the bar with the special character ─ (it's not dash -)
	# https://en.wikipedia.org/wiki/Box-drawing_character
	#bar=$(seq -s "─" $(($volume/5)) | sed 's/[0-9]//g')
	if [ "$volume" = "0" ]; then
		icon_name=$ICON_MUTED
		$DIR/notify-send.sh "$icon_name" -t 2000 -h int:value:"$volume" -h string:synchronous:"─" --replace=555
	else
		if [  "$volume" -lt "30" ]; then
			icon_name=$ICON_DOWN
			$DIR/notify-send.sh "$icon_name" --replace=555 -t 2000
		else
			icon_name=$ICON_UP
		fi
	fi
	bar=$(seq -s "─" $(($volume/5)) | sed 's/[0-9]//g')
	# Send the notification
	$DIR/notify-send.sh  "$icon_name $bar" -i "$icon_name" -t 2000 -h int:value:"$volume" -h string:synchronous:"$bar" --replace=555

}

case $1 in
	up)
		# Set the volume on (if it was muted)
		amixer -D pulse set Master on > /dev/null
		# Up the volume (+ 5%)
		amixer -D pulse sset Master 5%+ > /dev/null
		send_notification
		;;
	down)
		amixer -D pulse set Master on > /dev/null
		amixer -D pulse sset Master 5%- > /dev/null
		send_notification
		;;
	mute)
		# Toggle mute
		amixer -D pulse set Master 1+ toggle > /dev/null
		if is_mute ; then
			DIR=`dirname "$0"`
			$DIR/notify-send.sh -i $ICON_MUTED --replace=555 -u normal "$ICON_MUTED Mute" -t 2000
		else
			send_notification
		fi
		;;
esac
