#!/bin/bash
# open an emoji menu, then print selected emoji and copy to clipboard
var=$(cat -v ~/Scripts/.emoji.txt | dmenu -l 30)
read -ra ADDR <<< "$var"

for i in "${ADDR[@]}"; do
  if [ $i == ";" ]; then
    break
  else
    var="$var$i "
  fi
done


var=$"(cat .emoji.txt | grep "$var" | sed -r 's/ +/ /g')"
echo "$var"
read -ra ADDR <<< "$var"

next=0
for i in "${ADDR[@]}"; do
  echo "$next"
  if [ $next == 1 ]; then
    var="$i"
    break
  elif [ "$i" == "#" ]; then
    next=1
  fi
done
echo "$var" 
