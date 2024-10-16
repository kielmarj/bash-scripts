#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: bash-scripts/scripts/pql-info.sh                                      ┆
#┆ ABOUT: Lists all files installed by a package (pacman -Ql), but filters out ┆
#┆   directories and only prints paths to regular files.                       ┆
#┆ USAGE: $0 <package>                                                         ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

# If no argument is provided, echo usage and exit
if [[ -z $1 ]]; then
  echo "USAGE: $0 <package_name>"
  exit 1
fi

# Get list of all files installed by package $1
pacmanList=$(pacman -Ql "$1" | awk '{print $2}')

# Filter out the directories and only print paths of regular files
for f in $pacmanList; do
    if [[ -f $f ]] ; then
        echo "$f"
    fi
done
