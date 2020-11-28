#!/bin/sh

tput bell
paplay /usr/share/sounds/freedesktop/stereo/message.oga
notify-send 'New Email' '%n new messages, %u unread.' &
