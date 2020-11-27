#!/bin/sh

# selected=$( nmcli -t -f SSID dev wifi | sed -r '/^[[:space:]]*$/d' | rofi -dmenu -p "Wifi Networks")
# exec nmcli -t dev wifi connect "$selected"

execute_service() {
	command=$( echo "start
stop
restart" | rofi -dmenu -p "command" )
	if [ $command == "start" ]; then
		exec systemctl start $service
	fi
	if [ $command == "stop" ]; then
		exec systemctl stop $service
	fi
	if [ $command == "restart" ]; then
		exec systemctl restart $service
	fi
}

service=$(systemctl list-unit-files --no-pager --type=service --no-legend | awk '{print $1;}' | rofi -width 15 -dmenu -p "Services")

# start / stop / restart service
if [ $service ]; then
	execute_service
fi
