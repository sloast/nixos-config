#!/usr/bin/env bash

logfile="/home/adaad/swwwlog.log"

date &>> $logfile

rm /run/user/1000/swww.socket &>> $logfile
rm -r "$HOME/.cache/swww" &>> $logfile

swww query &>> $logfile
#if [ $? -eq 1 ] ; then
#    swww init &>> $logfile
#fi

swww init &>> $logfile
echo "$?" &>> "$logfile"
#swww img "$HOME/wallpapers/wall_anime2_4K.png" --transition-type any &>> $logfile
swww-random.sh &>> "$logfile"

