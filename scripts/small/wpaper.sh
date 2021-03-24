#!/bin/sh
# change current wallpaper and make it default
f="$(readlink -f $1)" &&
xwallpaper --zoom $f &&
echo "Wallpaper changed." &&
ln -fLs $f $HOME/pictures/wallpapers/wallpaper &&
echo "Image set to default."
