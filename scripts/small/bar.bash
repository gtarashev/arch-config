#!/bin/bash
counter=0
# create the log file variable
logfile="$HOME/.config/net/logfile"
echo "0 0" > $logfile

# continous loop
while :; do
    # update some things only once a min rather than once a second
    if [[ $(expr $counter % 60) == 0 ]] ; then
        # get the date and the time (see `man date`)
	    curr_date="$(date +'%A (%-e/%-m/%Y)')"
	    curr_time="$(date +'%-l:%M %p')"
	    # get the battery percentage (see `man upower` then grep and awk to format)
	    battery="$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | awk '{ print $2 }')"
	    # reset counter
	    counter=0
    fi
    
    # get the current down and up bytes (total since start of session) 
    rxcurrent="$(cat /proc/net/dev | grep 'wlo1' | awk '{ print $2 }')"
    txcurrent="$(cat /proc/net/dev | grep 'wlo1' | awk '{ print $10 }')"
    # get the old data
    prevdata="$(cat "$logfile")"

    # get the difference and format into Kib/s
    net="$(printf "DOWN: %sKib/s UP: %sKib/s" \
    "$(((rxcurrent-${prevdata%% *})/1024))" \
    "$(((txcurrent-${prevdata##* })/1024))")"
    
    # update the log file 
    echo "$rxcurrent $txcurrent" > "$logfile"

    # set xsetroot name ($DISPLAY is an environment variable declared by the system when
    # an xsession is started)
    xsetroot -d "$DISPLAY" -name "$net | BAT: $battery | $curr_date $curr_time"
    # update counter
    counter=$(expr $counter + 1)
    # sleep for a second (no need to update more often)
    sleep 1s
done
