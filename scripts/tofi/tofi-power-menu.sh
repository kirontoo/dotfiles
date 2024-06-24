#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Hibernate\n Hybrid Sleep\n Lock\n Logout" | tofi | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
    systemctl $op
    ;;
  hibernate)
    systemctl $op
    ;;
  "hybrid sleep")
    systemctl hybrid-sleep
    ;;
  lock)
    swaylock
    ;;
  logout)
    swaymsg exit
    ;;
esac
