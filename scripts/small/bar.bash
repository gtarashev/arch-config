#!/bin/bash
counter=0

# continous loop
while :; do
    # update some things only once a min rather than once a second
    if [[ $(expr $counter % 60) == 0 ]] ; then
        # get the date and the time (see `man date`)
	    curr_date="$(date +'%A (%-e/%-m/%Y)')"
	    curr_time="$(date +'%-l:%M %p')"
	    # get the battery percentage (see `man upower` then grep and awk to format)
	    battery="$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | awk '{ print $2 }')"
    fi

    # update once every 15 minutes (do not want to constantly send curl requests to wttr.in)
    if [[ $(expr $counter % 900) == 0 ]] ; then
      weather="$(curl -s wttr.in/burgas?format='%c+%t+(%f)')"
	    # reset counter
	    counter=0
    fi

    
    # set xsetroot name ($DISPLAY is an environment variable declared by the system when
    # an xsession is started)
    printing=`echo "$weather | 🔋 $battery | $curr_date  🕰 $curr_time" | sed 's/\xef\xd8\x8f//g'`

    xsetroot -d "$DISPLAY" -name "$printing"
    # update counter
    counter=$(expr $counter + 1)
    # sleep for a second (no need to update more often)
    sleep 1s
done




