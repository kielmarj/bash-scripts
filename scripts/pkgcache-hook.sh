#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: bash-scripts/scripts/pkgcache-hook.sh                                 ┆
#┆ ABOUT: Simple script for cleaning pacman's pkg cache with `paccache`.       ┆
#┆   `paccache` is provided by `pacman-contrib`.                               ┆
#┆ USAGE: Intended for use with pacman hook 'pkgcache.hook' (in this repo) to  ┆
#┆   automate cache cleaning every time a pkg is installed, removed, or        ┆
#┆   upgraded. But can also be executed as a standalone script.                ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

# Exec from /etc/pacman.d/hooks/pkgcache.hook for automated cache management
echo "Keeping 2 versions of currently installed packages:"
paccache -rvk2

echo "Keeping 0 versions of uninstalled packages:"
paccache -rvuk0

exit 0
