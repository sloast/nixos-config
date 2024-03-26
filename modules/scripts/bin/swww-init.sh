#!/usr/bin/env bash

date

rm /run/user/1000/swww.socket
rm -r "$HOME/.cache/swww"

swww query
#if [ $? -eq 1 ] ; then
#    swww init
#fi

swww init
#swww img "$HOME/wallpapers/wall_anime2_4K.png" --transition-type any
randomwal

