#!/bin/sh
# change current wallpaper and make it default
xwallpaper --zoom $1
ln -fLs $1 $HOME/pictures/wallpapers/wallpaper
