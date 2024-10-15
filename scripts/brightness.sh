#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: brightness.sh                                                         ┆
#┆ ABOUT: Adjusts brightness & sends notification. Requires `brightnessctl` &  ┆
#┆   `libnotify`. Optionally, set up icons for desktop notifications - see     ┆
#┆    1st comment, '### SETUP ICONS(1)'.                                       ┆
#┆ USAGE: $0 {--up|--down|--help}                                              ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

###
### SETUP ICONS(1): To enable notification icons, set iconDir below to the path
### of your icon directory. Then, scroll down to comment '### SETUP ICONS(2)'.
###
# !TODO better way to set up icons?
iconDir='/home/jess/.config/dunst/icon' # no trailing /

# Check for required programs
required_progs=(brightnessctl notify-send)
for prog in "${required_progs[@]}"; do
    if ! command -v "$prog" &>/dev/null; then
        printf 'ERROR: %s command not found\n' "$prog"
        exit 127
    fi
done

# Adjust brightness or display help
brightness_level="$(brightnessctl -m | cut -d, -f4 | tr -d '[:punct:]')"
USAGE="USAGE: $(basename "$0") {--up|--down|--help}"
if [[ "$1" == "--up" ]]; then
    brightnessctl set "+5" &>/dev/null
elif [[ "$1" == "--down" ]]; then
    brightnessctl --min-value=1 set "5-" &>/dev/null
elif [[ "$1" == "--help" ]]; then
    echo "$USAGE"
    exit 0
else
    echo "ERROR: Please provide a valid argument. $USAGE"
    exit 1
fi

# Re-fetch brightness_level
brightness_level="$(brightnessctl -m | cut -d, -f4 | tr -d '[:punct:]')"

# Check if iconDir exists
if ! [[ -d $iconDir ]]; then
    echo "ERROR: Icon directory $iconDir not found."
fi

###
### SETUP ICONS(2): ensure icon names in $iconDir match iconImgs referenced
### below.
###
if [[ "$brightness_level" -le "20" ]]; then
    iconImg="$iconDir/brightness-20.png"
elif [[ "$brightness_level" -le "40" ]]; then
    iconImg="$iconDir/brightness-40.png"
elif [[ "$brightness_level" -le "60" ]]; then
    iconImg="$iconDir/brightness-60.png"
elif [[ "$brightness_level" -le "80" ]]; then
    iconImg="$iconDir/brightness-80.png"
elif [[ "$brightness_level" -le "100" ]]; then
    iconImg="$iconDir/brightness-100.png"
fi

# Check if icon exists
if ! [[ -f "$iconImg" ]]; then
    echo "ERROR: Notification icon $iconImg not found."
fi

# Send notification
notify-send -t 3000 -e -h string:x-canonical-private-synchronous:brightness \
    -h int:value:"$brightness_level" -u low -i "$iconImg" \
    "Brightness $brightness_level%" &>/dev/null

exit 0
