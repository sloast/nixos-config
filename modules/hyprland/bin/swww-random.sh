#!/usr/bin/env bash

wallpapers="$HOME/wallpapers"

selection=$(ls $wallpapers | shuf -n 1)

swww img "$wallpapers/$selection" --transition-type any

