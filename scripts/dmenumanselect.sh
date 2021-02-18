#!/bin/sh

man -k . | cut -d " " -f 1 | dmenu -l 30 -fn "Ubuntu Mono:size=16" | xargs man -Tpdf | zathura -
