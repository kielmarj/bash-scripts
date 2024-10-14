#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: gtk-settings.sh                                                       ┆
#┆ ABOUT: Set gtk preferences on startup. For manual configuration of gtk,     ┆
#┆   may not work well if you've configured any settings with apps like        ┆
#┆   nwg-look.                                                                 ┆
#┆ USAGE:  Exec-once in hyprland.conf.                                         ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

gsettings set de.haeckerfelix.Shortwave dark-mode true
gsettings set de.haeckerfelix.Shortwave recorder-save-count 10
gsettings set org.gnome.desktop.interface color-scheme \'prefer-dark\'
gsettings set org.gnome.desktop.interface cursor-blink-timeout 3
gsettings set org.gnome.desktop.interface cursor-size 32
gsettings set org.gnome.desktop.interface cursor-theme \'Bibata-Modern-Classic\'
gsettings set org.gnome.desktop.interface document-font-name \'IosevkaTerm\ Nerd\ Font 12\'
gsettings set org.gnome.desktop.interface font-antialiasing \'rgba\'
gsettings set org.gnome.desktop.interface font-hinting \'full\'
gsettings set org.gnome.desktop.interface font-name \'IosevkaTerm\ Nerd\ Font\ 12\'
gsettings set org.gnome.desktop.interface gtk-theme \'Sweet-Dark\'
gsettings set org.gnome.desktop.interface icon-theme \'BeautyLine\'
gsettings set org.gnome.desktop.interface monospace-font-name \'IosevkaTerm\ Nerd\ Font\ 12\'
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences titlebar-font \'IosevkaTerm\ Nerd\ Font\ 12\'
exit 0
