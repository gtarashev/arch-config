#!/bin/sh
# change current wallpaper and make it default
f="$(readlink -f $1)" &&
feh --bg-scale $f &&
echo "Wallpaper changed." &&
ln -fLs $f $HOME/pictures/wallpapers/wallpaper &&
echo "Image set to default."
