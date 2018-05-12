#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " "` < 20% ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send "LOW BATTERY" "$BATTINFO"
fi
