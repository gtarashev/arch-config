#!/bin/bash
# open emoji menu (with -v because I cant seem to set a font with 
# which it doesn't break)
emoji=$(cat -v ./emoji.txt | dmenu -l 30 -fn "Ubuntu Mono:size=16" | cut -d " " -f 2-)

# get the emoji from the file and put into xclip 
grep "$emoji" ./emoji.txt | cut -d " " -f 1 | xclip -i
