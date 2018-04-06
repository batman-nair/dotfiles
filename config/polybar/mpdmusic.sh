#!/bin/bash

icon=""

song=$(mpc current)
status=$(mpc | awk 'NR==2 {split($1, arr, "[][]"); print arr[2]}')

if [ "$status" == "playing" ]; then
	echo "$icon $song"
else
	echo "%{F#65737E}$icon $song"
fi
