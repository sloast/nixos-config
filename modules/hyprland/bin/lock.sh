#!/usr/bin/env bash

tmp=`mktemp -d -p /tmp`

echo $tmp


# check if tmp dir was created
if [[ ! "$tmp" || ! -d "$tmp" ]]; then
  echo "Could not create temp dir"
  exit 1
fi


function cleanup {
    rm -rf $tmp
}

trap cleanup EXIT

pushd "$tmp" || exit

grim -t jpeg screen.jpg

#  image="icons/$(shuf -i0-2 -n1).png"

if [[ "$1" != "" ]]; then
    blur=$1
else
    blur=20
fi

# blur screenshot
ffmpeg -i screen.jpg -vf "[in] gblur=sigma=$blur [a] ; [a] eq=saturation=1.5 [out]" logo-ed_screen.png


#ffmpeg -i screen.jpg -vf \
#  "[in] gblur=sigma=$1  [blurred]; movie=$image [logo];
#  [blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
#  logo-ed_screen.png


#import pywal colors
source "$HOME/.cache/wal/colors.sh"

swaylock \
  --image "logo-ed_screen.png" \
  --daemonize \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  --key-hl-color "$color1" \
  --bs-hl-color "$color2" \
  --ring-color "$background" \
  --ring-clear-color "$color2" \
  --ring-wrong-color "$color5" \
  --ring-ver-color "$color3" \
  --line-uses-ring \
  --line-color 00000000 \
  --font 'FiraCode Nerd Font' \
  --text-color 00000000 \
  --text-clear-color "$color2" \
  --text-wrong-color "$color5" \
  --text-ver-color "$color4" \
  --separator-color 00000000

popd

