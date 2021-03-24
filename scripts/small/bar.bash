#!/bin/bash
counter=0
while :; do
    if [[ $(expr $counter % 60) == 0 ]] ; then
	curr_date="$(date +'%A (%-e/%-m/%Y)')"
	curr_time="$(date +'%-l:%M %p')"
	battery="$(cat /sys/class/power_supply/BAT1/capacity)"
	counter=0
    fi
    

    # networking
    logfile="$HOME/.config/net/logfile"
    # get current
    rxcurrent="$(cat /sys/class/net/wlp2s0/statistics/rx_bytes)"
    txcurrent="$(cat /sys/class/net/wlp2s0/statistics/tx_bytes)"
    prevdata="$(cat "$logfile")"

    # get up diff
    net="$(printf "🔻 %sKib/s 🔺 %sKib/s" \
    "$(((rxcurrent-${prevdata%% *})/1024))" \
    "$(((txcurrent-${prevdata##* })/1024))")"
    
    echo "$rxcurrent $txcurrent" > "$logfile"

    xsetroot -d "$DISPLAY" -name "$net | 🔋 $battery% | 📅 $curr_date | ⏰ $curr_time"
    counter=$(expr $counter + 1)
    sleep 2s
done
