#!/bin/bash
valuefile="/tmp/scratch-value.dat"

scratch_type="$1"
if [ "$scratch_type" = "curr" ]; then
  # if we don't have a file, start at browser
  if [ ! -f "$valuefile" ]; then
      scratch_type="browser"
  # otherwise read the value from the file
  else
      scratch_type=$(cat "$valuefile")
  fi
fi

echo "${scratch_type}" > "$valuefile"

configfile="$HOME/.config/sway/config-$scratch_type"

if [ ! -f "$configfile" ]; then
    exit
fi

# echo "opening scratch: $1" >> ~/scratch-log

swaymsg "[con_mark=$scratch_type] scratchpad show, mode passthrough" || (sway -c "$configfile" & PID=$! && sleep 1 && swaymsg "[pid=$PID] move to scratchpad, scratchpad show, mode passthrough, mark $scratch_type, resize set $2 $3")
