#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " "` < 20% ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "LOW BATTERY" "$BATTINFO"
fi
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " "` < 05% ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "VERY LOW BATTERY" "Shutting down in 3 mins"
    shutdown +1
fi
if [[ `echo $BATTINFO | grep Charging` && `echo $BATTINFO | cut -f 4 -d " "` < 06% ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u low "Charging" "Cancelling any shutdown"
    shutdown --no-wal -c
fi
if [[ `echo $BATTINFO | grep Full` ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u low "FULL BATTERY" "$BATTINFO"
fi
