#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: bash-scripts/scripts/getpkginfo.sh                                    ┆
#┆ ABOUT: Fetches info about an installed package or command, including an     ┆
#┆   organized list of all commands, manpages, and other readable files owned  ┆
#┆   by the package.                                                           ┆
#┆ USAGE:  $0 <name of installed package or command>                           ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

# Echo usage and exit if number of args is not 1
if [[ $# -ne 1 ]]; then
  echo "USAGE: $(basename $0) <name of installed package or command>"
  exit 1
fi

# If $1 is not an installed package or command, exit
if ! pacman -Qi $1 >/dev/null 2>&1 && ! pacman -Qo $1 >/dev/null 2>&1; then
    echo -e "${1} not found in local pacman database.
    \rTry 'pacman -Ss ${1}' to search for the correct package name."
    exit 2
# Check if $1 is a package name
elif pacman -Qi $1 >/dev/null 2>&1; then
    PACKAGE="$1"
# If $1 is a command, find the package that owns it
else
    PACKAGE="$(pacman -Qo "$1" | awk '{print $5}')"
    echo -e "\n${1} is a command provided by ${PACKAGE}."
fi

# Print package info from pacman -Qi, omitting fields containing 'None'
echo -e "\n#### ${PACKAGE} PACKAGE INFO ####"
pacman -Qi "$PACKAGE" | awk '!/None/'

# Find executables from pacman -Ql and echo their basenames
echo -e "\n#### COMMANDS PROVIDED BY ${PACKAGE} ####"
pacmanList=$(pacman -Ql "$PACKAGE" | awk '{print $2}')
for list in $pacmanList; do
    if [[ -x $list && ! -d $list ]]; then
        echo "$list" | awk '!/.so/ && !/.gz/' | xargs basename 2>/dev/null
    fi
done

# Find manpages from pacman -Ql
echo -e "\n#### MANPAGES PROVIDED BY ${PACKAGE} ####
    \r # NOTE: manpages are suffixed by their respective manpage sections;
    \r # i.e., 'somecommand.5' could be called by 'man 5 somecommand'"
for list in $pacmanList; do
if [[ ! -d $list ]]; then
    echo "$list" | grep '/usr/share/man/' | xargs basename -s .gz 2>/dev/null
fi
done

echo -e "\n#### OTHER READABLE FILES INSTALLED BY ${PACKAGE} ####"
for list in $pacmanList; do
    if [[ ! -d $list && ! -x $list && -f $list && -r $list ]]; then
        echo "$list" | awk '!/\/usr\/share\/man\// && !/\/usr\/share\/locale\//'
    fi
done

exit 0
