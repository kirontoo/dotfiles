#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x
## Modified from source: https://github.com/adi1090x/rofi

dir="$HOME/.config/rofi/simple-menu.rasi"
rofi_command="rofi -theme $dir -i"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/prompt.rasi" -e "Please install 'scrot' first."
}

# Options
screen=" Screen"
area=" Area"
window=" Window"

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -lines 3 -width 15 -p 'Scrot' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; -q 90 scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots | sxiv $$(xdg-user-dir PICTURES)/Screenshots/$f | xclip -selection c -t image/png $$(xdg-user-dir PICTURES)/Screenshots/$f | notify-send "$screen screenshot was made"'
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -q 90 -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots | sxiv $$(xdg-user-dir PICTURES)/Screenshots/$f | xclip -selection c -t image/png $$(xdg-user-dir PICTURES)/Screenshots/$f | notify-send "$area screenshot was made"'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -q 90 -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots | sxiv $$(xdg-user-dir PICTURES)/Screenshots/$f | xclip -selection c -t image/png $$(xdg-user-dir PICTURES)/Screenshots/$f | notify-send "$window screenshot was made"'
		else
			msg
		fi
        ;;
esac
