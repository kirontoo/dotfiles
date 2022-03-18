#!/bin/sh

main() {
	spotify_source=""
  if pgrep -x spotifyd >/dev/null; then
		spotify_source="spotifyd"
	elif pgrep -x spotify >/dev/null; then
		spotify_source="spotify"
	else 
		echo ""; exit
  fi


  cmd="org.freedesktop.DBus.Properties.Get"
  domain="org.mpris.MediaPlayer2"
  path="/org/mpris/MediaPlayer2"

  meta=$(dbus-send --print-reply --dest=${domain}.${spotify_source} \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1  | sed 's/\&/\\&/g' | sed 's#\/#\\/#g')
  album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1| sed 's/\&/\\&/g'| sed 's#\/#\\/#g')
  title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\&/\\&/g'| sed 's#\/#\\/#g')

  echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed "s/\&/\&/g" | sed "s#\/#\/#g"

}

main "$@"
