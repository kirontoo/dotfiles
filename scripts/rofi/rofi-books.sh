#!/bin/bash
## Author: Kirontoo
## Dependenies: zathura, rofi

# TODO: search epub files too

function get_books() {
	find $(xdg-user-dir DOCUMENTS)/books -name '*.pdf' -printf "%f\n"
}

count=$( get_books | wc -l )

function get_max_lines() {
	if [ ${count} -gt 10 ]; then
		echo 15
	else
		echo $count
	fi
}

lines=$( get_max_lines )

BOOK_SELECTION=$( ( get_books ) | rofi -dmenu -theme simple-menu -i -p "Open PDF" -width 15 -fixed-num-lines 10 -lines ${lines})

if [[ -z "${BOOK_SELECTION}" ]]; then
	echo "Cancel"
else
	directory_path=$(find $(xdg-user-dir DOCUMENTS)/books -name "${BOOK_SELECTION}")
	echo ${directory_path}
	foxitreader ${directory_path} &
	exit
fi
