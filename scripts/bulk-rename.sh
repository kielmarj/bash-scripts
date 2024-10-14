#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: bulk-rename.sh                                                        ┆
#┆ ABOUT: Bulk-renames all files in a directory "01.ext, 02.ext, 03.ext...etc".┆
#┆   Makes a copy of the directory passed to the script before renaming any    ┆
#┆   files. Renamed files will be located in '<directory>_renamed/'.           ┆
#┆ USAGE: $0 </path/of/directory>                                              ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

# Create temp lockfile to prevent multiple instances from running
LOCKFILE="/tmp/$(basename "$0").lock"
exec 200>"$LOCKFILE"
flock -n 200 || {
    echo "Another instance of this script is already running. Exiting."
    exit 1
}

# Set usage
USAGE="USAGE: $0 </path/of/directory>"

# Handle help option
if [[ "$1" == "--help" ]]; then
    echo "$USAGE"
    exit 0
fi

# Get input directory and create output directory
directory="$1"
newDirectory="$(dirname "$directory")/$(basename "$directory")_renamed"

# Validate directory
if [[ -d "$directory" ]]; then
    mkdir -p "$newDirectory"
else
    echo "ERROR: '$1' is not a valid directory. $USAGE"
    exit 1
fi

# Rename files in the directory
counter=1
for originalFile in "$directory"/*; do
    # Extract file extension
    extension="${originalFile##*.}"
    # Copy file with new name to new directory
    cp "$originalFile" "$newDirectory/$(printf "%02d.%s" "$counter" "$extension")"
    # Increment counter
    counter=$((counter + 1))
done

echo "Renamed files in $newDirectory"

exit 0
