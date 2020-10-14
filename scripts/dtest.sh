#!/bin/bash

pidof dunst && killall dunst
dunst &

notify-send "message one"
