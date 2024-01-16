#!/bin/bash
configfile="$HOME/.config/sway/config-$1"

if [ ! -f "$configfile" ]; then
    exit
fi

# echo "opening scratch: $1" >> ~/scratch-log

swaymsg "[con_mark=$1] scratchpad show, mode passthrough" || (sway -c "$configfile" & PID=$! && sleep 1 && swaymsg "[pid=$PID] move to scratchpad, scratchpad show, mode passthrough, mark $1, resize set $2 $3")
