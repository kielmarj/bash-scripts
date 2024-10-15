#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: brightness.sh                                                         ┆
#┆ ABOUT: Adjusts brightness & sends notification. Requires `brightnessctl` &  ┆
#┆   `libnotify`.                                                              ┆
#┆ USAGE: $0 {--up|--down|--help} See comment '### SETUP' below to enable      ┆
#┆   notifications.                                                            ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

### SETUP To enable notifications, set iconDir below to the path of your icon
### directory (no trailing `/`). Then, scroll down to '### SETUP ICONS'.
iconDir='/home/jess/.config/dunst/icons'

# List required programs
required_progs=(brightnessctl notify-send)

# Check for required programs
for prog in "${required_progs[@]}"; do
    if ! command -v "$prog" &>/dev/null; then
        printf 'ERROR: %s command not found\n' "$prog"
        exit 127
    fi
done

# Check if iconDir exists
if ! [[ -d $iconDir ]]; then
    echo "ERROR: Icon directory $iconDir not found."
    exit 1
fi

# Assign variable for help message
USAGE="USAGE: $(basename "$0") {--up|--down|--help}"

# Assign variable to determine brightness level
brightness_level="$(brightnessctl -m | cut -d, -f4 | tr -d '[:punct:]')"

# Adjust brightness or display help
if [[ "$1" == "--up" ]]; then
    brightnessctl set "+5%" &>/dev/null
elif [[ "$1" == "--down" ]]; then
    # Avoid setting brightness to 0
    if [[ "$brightness_level" -le "5" ]]; then
        echo "ERROR: Brightness already set to lowest possible level."
        exit 1
    else
        brightnessctl set "5%-" &>/dev/null
    fi
elif [[ "$1" == "--help" ]]; then
    echo "$USAGE"
    exit 0
else
    echo "ERROR: Please provide a valid argument. $USAGE"
    exit 1
fi

# Re-fetch brightness_level
brightness_level="$(brightnessctl -m | cut -d, -f4 | tr -d '[:punct:]')"

### SETUP ICONS Ensure icon names in $iconDir match iconImgs referenced below.
# Fetch icon based on current level
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
