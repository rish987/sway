#!/bin/bash

valuefile="/tmp/value.dat"

# if we don't have a file, start at zero
if [ ! -f "$valuefile" ]; then
    value="off"
# otherwise read the value from the file
else
    value=$(cat "$valuefile")
fi

# show it to the user
echo "value: ${value}"
temp=4500
brightness=0.65

if [ "$value" = "off" ]; then
  gammastep -l 0:0 -o -b $brightness:$brightness -t $temp:$temp &
  value="$!"
else
  kill -9 "$value"
  value="off"
fi

echo "${value}" > "$valuefile"
