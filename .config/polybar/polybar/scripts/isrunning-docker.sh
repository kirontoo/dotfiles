#!/bin/sh

UNIT="docker.service"

journalctl --follow -o cat --unit $UNIT | while read -r; do
	if [ "$(systemctl is-active "$UNIT")" = "active" ]; then
        echo ""
	else 
		echo ""
	fi
done
