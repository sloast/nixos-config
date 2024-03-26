#!/bin/bash

wallpapers="$HOME/wallpapers"

if [ ! -d $wallpapers ]; then
    echo "No wallpapers directory found at $wallpapers"
    exit 1
fi

selection=$(find "$wallpapers" -not -path "*/.*" -type f | shuf -n 1)

swww img "$selection" --transition-type any

