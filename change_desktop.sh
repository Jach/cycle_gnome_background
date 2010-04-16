#!/bin/sh

IMG_DIR="/loc/to/images"
cd $IMG_DIR

IMGS=`find . -iname '*.jpg' -o -iname '*.png' -o -iname '*.svg'`

#Find out how many pictures we got
N=`echo $IMGS | wc -w`

#That take a number between 0 and N-1. We must to add 1.
((N=(RANDOM%N)+1))


BGNAME=`echo -e $IMGS | sed s@\./@@g | cut -d ' ' -f $N`
echo "Using image "$BGNAME

gconftool-2 -t str --set /desktop/gnome/background/picture_filename "$IMG_DIR""$BGNAME"

#Possible values are "none", "wallpaper" (eg tiled), "centered", "scaled", "stretched"
gconftool-2 -t str --set /desktop/gnome/background/picture_options "scaled"

#uncomment if you want your desktop to show and unshow
#python /path/to/show_desktop.py

