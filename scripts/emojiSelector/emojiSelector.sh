#!/bin/bash
# open an emoji menu, then print selected emoji and copy to clipboard
var=$(cat ~/scripts/emoji.txt | dmenu -l 30 -fn "Ubuntu Mono:size=16")
