#!/bin/bash

while [ 1 == 1 ]; do
  curr_date="$(date +'%A (%-e/%-m/%Y)')"
  curr_time="$(date +'%-l:%M %p')"
  battery="$(cat /sys/class/power_supply/BAT1/capacity)"
  xsetroot -name " 🔋 $battery% | 📅 $curr_date | ⏰ $curr_time"
  sleep 1
done
