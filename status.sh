#!/bin/dash
sp=$(if [ -f /tmp/scratchpad ];then echo " ON";else echo "";fi)
cpu=$(top -b -n 1 | grep Cpu | awk '{print $2}')%
temp=$(($(cat /sys/class/thermal/thermal_zone*/temp)/1000))°
mem=$(free -m | grep "Mem" | awk '{print $3}')
wifi=$(cat /proc/net/wireless | awk '{print $3+$2}' | tail -1)
eth=$(cat /sys/class/net/eth0/operstate | tr [:lower:] [:upper:])
vol=$(if [ "$(pacmd list-sinks | awk '/muted/ { print $2 }')" = "yes" ]; then echo " Muted"; else echo " $(pactl list sinks | tr ' ' '\n' | grep -m1 '%' | tr -d '%')"; fi)""
date=$(date +'%a %_d, %l:%M %p')

echo "$sp    $cpu    $temp    $mem    $wifi    $eth   $vol    $date  "
exit 0
