#!/usr/bin/env bash

rm /run/user/1000/swww.socket
rm -r "$HOME/.cache/swww"
logfile="/dev/null"
echo "run" >> "$logfile"
#swww query &>> $logfile
#if [ $? -eq 1 ] ; then
#    swww init &>> $logfile
#fi
swww init &>> $logfile
echo "$?" &>> "$logfile"
#swww img "$HOME/wallpapers/wall_anime2_4K.png" --transition-type any &>> $logfile
swww-random.sh

