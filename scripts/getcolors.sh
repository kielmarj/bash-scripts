#!/usr/bin/env bash

#╭━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╮
#┆ FILE: getcolors.sh                                                          ┆
#┆ ABOUT: Color script for generating different palettes based on your current ┆
#┆   color scheme. Prints color blocks or a colorized list of current colors,  ┆
#┆   plus *special* palettes. NOTE: .pywal. is only required for option '-l'.  ┆
#┆ USAGE: $0 -h to print help displaying all options.                          ┆
#┆ REPO: <https://github.com/kielmarj/bash-scripts>                            ┆
#┆ © 2024 Jessica Kielmar <kielmarj@gmail.com>, MIT License                    ┆
#╰━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━◦○◦━╯

#-------------------------------------------------------------------------------
#
# Note: pywal is only -required- for option -l
#
# OPTIONS
# -b  color blocks, labelled with ANSI color names
# -n  color blocks, no text
# -l  colorized list displaying ANSI color names, hex values, and rgb values
# -h  show this help message
#
# SPECIAL PALETTES
# -a  arch - original art by Ivo*
# -i  space invaders - original art by pfh*
# -p  pacman - original art by pfh*
# -s  rainbow puke skull - original art by xero http://0w.nz
# -t  battle tank - original art by muzieca*
# *see script comments for more info on sources for the original scripts that
#  inspired these special palettes
#
#-------------------------------------------------------------------------------

hex="$HOME/.cache/wal/colors"
rgb="$HOME/.cache/wal/colors-rgb"

e="\e"; r="${e}[0m"
f="${e}[3"
f0="${f}0m";f1="${f}1m";f2="${f}2m";f3="${f}3m";f4="${f}4m";f5="${f}5m";f6="${f}6m";f7="${f}7m"
bf="${e}[9"
bf0="${bf}0m";bf1="${bf}1m";bf2="${bf}2m";bf3="${bf}3m";bf4="${bf}4m";bf5="${bf}5m";bf6="${bf}6m";bf7="${bf}7m"
b="${e}[4"
b0="${b}0m";b1="${b}1m";b2="${b}2m";b3="${b}3m";b4="${b}4m";b5="${b}5m";b6="${b}6m";b7="${b}7m"
bb="${e}[10"
bb0="${bb}0m";bb1="${bb}1m";bb2="${bb}2m";bb3="${bb}3m";bb4="${bb}4m";bb5="${bb}5m";bb6="${bb}6m";bb7="${bb}7m"

blocks_labelled() {
    echo -e "${r}"
    echo -e "   COLOR0 ${b0}          ${bb0}          ${r} COLOR8"
    echo -e "    BLACK ${b0}          ${bb0}          ${r} BRBLACK"
    echo -e "          ${b0}          ${bb0}          ${r}"
    echo -e "   COLOR1 ${b1}          ${bb1}          ${r} COLOR9"
    echo -e "      RED ${b1}          ${bb1}          ${r} BRRED"
    echo -e "          ${b1}          ${bb1}          ${r}"
    echo -e "   COLOR2 ${b2}          ${bb2}          ${r} COLOR10"
    echo -e "    GREEN ${b2}          ${bb2}          ${r} BRGREEN"
    echo -e "          ${b2}          ${bb2}          ${r}"
    echo -e "   COLOR3 ${b3}          ${bb3}          ${r} COLOR11"
    echo -e "   YELLOW ${b3}          ${bb3}          ${r} BRYELLOW"
    echo -e "          ${b3}          ${bb3}          ${r}"
    echo -e "   COLOR4 ${b4}          ${bb4}          ${r} COLOR12"
    echo -e "     BLUE ${b4}          ${bb4}          ${r} BRBLUE"
    echo -e "          ${b4}          ${bb4}          ${r}"
    echo -e "   COLOR5 ${b5}          ${bb5}          ${r} COLOR13"
    echo -e "  MAGENTA ${b5}          ${bb5}          ${r} BRMAGENTA"
    echo -e "          ${b5}          ${bb5}          ${r}"
    echo -e "   COLOR6 ${b6}          ${bb6}          ${r} COLOR14"
    echo -e "     CYAN ${b6}          ${bb6}          ${r} BRCYAN"
    echo -e "          ${b6}          ${bb6}          ${r}"
    echo -e "   COLOR7 ${b7}          ${bb7}          ${r} COLOR15"
    echo -e "    WHITE ${b7}          ${bb7}          ${r} BRWHITE"
    echo -e "          ${b7}          ${bb7}          ${r}"
    echo ""
}

blocks_notext() {
    echo -e "${r}"
    echo -e "  ${b0}          ${bb0}          ${r}"
    echo -e "  ${b0}          ${bb0}          ${r}"
    echo -e "  ${b0}          ${bb0}          ${r}"
    echo -e "  ${b1}          ${bb1}          ${r}"
    echo -e "  ${b1}          ${bb1}          ${r}"
    echo -e "  ${b1}          ${bb1}          ${r}"
    echo -e "  ${b2}          ${bb2}          ${r}"
    echo -e "  ${b2}          ${bb2}          ${r}"
    echo -e "  ${b2}          ${bb2}          ${r}"
    echo -e "  ${b3}          ${bb3}          ${r}"
    echo -e "  ${b3}          ${bb3}          ${r}"
    echo -e "  ${b3}          ${bb3}          ${r}"
    echo -e "  ${b4}          ${bb4}          ${r}"
    echo -e "  ${b4}          ${bb4}          ${r}"
    echo -e "  ${b4}          ${bb4}          ${r}"
    echo -e "  ${b5}          ${bb5}          ${r}"
    echo -e "  ${b5}          ${bb5}          ${r}"
    echo -e "  ${b5}          ${bb5}          ${r}"
    echo -e "  ${b6}          ${bb6}          ${r}"
    echo -e "  ${b6}          ${bb6}          ${r}"
    echo -e "  ${b6}          ${bb6}          ${r}"
    echo -e "  ${b7}          ${bb7}          ${r}"
    echo -e "  ${b7}          ${bb7}          ${r}"
    echo -e "  ${b7}          ${bb7}          ${r}"
    echo ""
}

color_list() {
    echo -e "${r}"
    echo -e "  ${f0} COLOR  0 | BLACK     | HEX $(sed -n '1p' ${hex}) | RGB ($(sed -n '1p' ${rgb}))"
    echo -e "  ${f1} COLOR  1 | RED       | HEX $(sed -n '2p' ${hex}) | RGB ($(sed -n '2p' ${rgb}))"
    echo -e "  ${f2} COLOR  2 | GREEN     | HEX $(sed -n '3p' ${hex}) | RGB ($(sed -n '3p' ${rgb}))"
    echo -e "  ${f3} COLOR  3 | YELLOW    | HEX $(sed -n '4p' ${hex}) | RGB ($(sed -n '4p' ${rgb}))"
    echo -e "  ${f4} COLOR  4 | BLUE      | HEX $(sed -n '5p' ${hex}) | RGB ($(sed -n '5p' ${rgb}))"
    echo -e "  ${f5} COLOR  5 | MAGENTA   | HEX $(sed -n '6p' ${hex}) | RGB ($(sed -n '6p' ${rgb}))"
    echo -e "  ${f6} COLOR  6 | CYAN      | HEX $(sed -n '7p' ${hex}) | RGB ($(sed -n '7p' ${rgb}))"
    echo -e "  ${f7} COLOR  7 | WHITE     | HEX $(sed -n '8p' ${hex}) | RGB ($(sed -n '8p' ${rgb}))"
    echo -e "  ${bf0} COLOR  8 | BRBLACK   | HEX $(sed -n '9p' ${hex}) | RGB ($(sed -n '9p' ${rgb}))"
    echo -e "  ${bf1} COLOR  9 | BRRED     | HEX $(sed -n '10p' ${hex}) | RGB ($(sed -n '10p' ${rgb}))"
    echo -e "  ${bf2} COLOR 10 | BRGREEN   | HEX $(sed -n '11p' ${hex}) | RGB ($(sed -n '11p' ${rgb}))"
    echo -e "  ${bf3} COLOR 11 | BRYELLOW  | HEX $(sed -n '12p' ${hex}) | RGB ($(sed -n '12p' ${rgb}))"
    echo -e "  ${bf4} COLOR 12 | BRBLUE    | HEX $(sed -n '13p' ${hex}) | RGB ($(sed -n '13p' ${rgb}))"
    echo -e "  ${bf5} COLOR 13 | BRMAGENTA | HEX $(sed -n '14p' ${hex}) | RGB ($(sed -n '14p' ${rgb}))"
    echo -e "  ${bf6} COLOR 14 | BRCYAN    | HEX $(sed -n '15p' ${hex}) | RGB ($(sed -n '15p' ${rgb}))"
    echo -e "  ${bf7} COLOR 15 | BRWHITE   | HEX $(sed -n '16p' ${hex}) | RGB ($(sed -n '16p' ${rgb}))"
    echo -e "${r}"
}

palette_arch() {
# original ANSI colorscheme & art by: Ivo
# source: http://crunchbang.org/forums/viewtopic.php?pid=237794#p237794
    echo -e "${r}"
    echo -e "  ${f1}        ■      ${f2}        ■      ${f3}        ■      ${f4}        ■       ${f5}       ■      ${f6}        ■      ${r}"
    echo -e "  ${f1}       ■■■     ${f2}       ■■■     ${f3}       ■■■     ${f4}       ■■■      ${f5}      ■■■     ${f6}       ■■■     ${r}"
    echo -e "  ${f1}      ■■■■■    ${f2}      ■■■■■    ${f3}      ■■■■■    ${f4}      ■■■■■     ${f5}     ■■■■■    ${f6}      ■■■■■    ${r}"
    echo -e "  ${f1}     ■(   )■   ${f2}     ■(   )■   ${f3}     ■(   )■   ${f4}     ■(   )■    ${f5}    ■(   )■   ${f6}     ■(   )■   ${r}"
    echo -e "  ${f1}    ■■■■ ■■■■  ${f2}    ■■■■ ■■■■  ${f3}    ■■■■ ■■■■  ${f4}    ■■■■ ■■■■   ${f5}   ■■■■ ■■■■  ${f6}    ■■■■ ■■■■  ${r}"
    echo -e "  ${f1}   ■■       ■■ ${f2}   ■■       ■■ ${f3}   ■■       ■■ ${f4}   ■■       ■■  ${f5}  ■■       ■■ ${f6}   ■■       ■■ ${r}"
    echo ""
    echo -e "  ${bf1}        ■      ${bf2}        ■      ${bf3}        ■      ${bf4}        ■       ${bf5}       ■      ${bf6}        ■      ${r}"
    echo -e "  ${bf1}       ■■■     ${bf2}       ■■■     ${bf3}       ■■■     ${bf4}       ■■■      ${bf5}      ■■■     ${bf6}       ■■■     ${r}"
    echo -e "  ${bf1}      ■■■■■    ${bf2}      ■■■■■    ${bf3}      ■■■■■    ${bf4}      ■■■■■     ${bf5}     ■■■■■    ${bf6}      ■■■■■    ${r}"
    echo -e "  ${bf1}     ■(   )■   ${bf2}     ■(   )■   ${bf3}     ■(   )■   ${bf4}     ■(   )■    ${bf5}    ■(   )■   ${bf6}     ■(   )■   ${r}"
    echo -e "  ${bf1}    ■■■■ ■■■■  ${bf2}    ■■■■ ■■■■  ${bf3}    ■■■■ ■■■■  ${bf4}    ■■■■ ■■■■   ${bf5}   ■■■■ ■■■■  ${bf6}    ■■■■ ■■■■  ${r}"
    echo -e "  ${bf1}   ■■       ■■ ${bf2}   ■■       ■■ ${bf3}   ■■       ■■ ${bf4}   ■■       ■■  ${bf5}  ■■       ■■ ${bf6}   ■■       ■■ ${r}"
    echo -e "${r}"
}

palette_invaders() {
# original ANSI colorscheme & art by: pfh
# source: http://crunchbanglinux.org/forums/post/126921/#p126921
echo -e "${r}"
echo -e "  ${f1}  ▀▄   ▄▀     ${f2} ▄▄▄████▄▄▄    ${f3}  ▄██▄     ${f4}  ▀▄   ▄▀     ${f5} ▄▄▄████▄▄▄    ${f6}  ▄██▄  ${r}"
echo -e "  ${f1} ▄█▀███▀█▄    ${f2}███▀▀██▀▀███   ${f3}▄█▀██▀█▄   ${f4} ▄█▀███▀█▄    ${f5}███▀▀██▀▀███   ${f6}▄█▀██▀█▄${r}"
echo -e "  ${f1}█▀███████▀█   ${f2}▀▀███▀▀███▀▀   ${f3}▀█▀██▀█▀   ${f4}█▀███████▀█   ${f5}▀▀███▀▀███▀▀   ${f6}▀█▀██▀█▀${r}"
echo -e "  ${f1}▀ ▀▄▄ ▄▄▀ ▀   ${f2} ▀█▄ ▀▀ ▄█▀    ${f3}▀▄    ▄▀   ${f4}▀ ▀▄▄ ▄▄▀ ▀   ${f5} ▀█▄ ▀▀ ▄█▀    ${f6}▀▄    ▄▀${r}"
echo ""
echo -e "  ${bf1}▄ ▀▄   ▄▀ ▄   ${bf2} ▄▄▄████▄▄▄    ${bf3}  ▄██▄     ${bf4}▄ ▀▄   ▄▀ ▄   ${bf5} ▄▄▄████▄▄▄    ${bf6}  ▄██▄  ${r}"
echo -e "  ${bf1}█▄█▀███▀█▄█   ${bf2}███▀▀██▀▀███   ${bf3}▄█▀██▀█▄   ${bf4}█▄█▀███▀█▄█   ${bf5}███▀▀██▀▀███   ${bf6}▄█▀██▀█▄${r}"
echo -e "  ${bf1}▀█████████▀   ${bf2}▀▀▀██▀▀██▀▀▀   ${bf3}▀▀█▀▀█▀▀   ${bf4}▀█████████▀   ${bf5}▀▀▀██▀▀██▀▀▀   ${bf6}▀▀█▀▀█▀▀${r}"
echo -e "  ${bf1} ▄▀     ▀▄    ${bf2}▄▄▀▀ ▀▀ ▀▀▄▄   ${bf3}▄▀▄▀▀▄▀▄   ${bf4} ▄▀     ▀▄    ${bf5}▄▄▀▀ ▀▀ ▀▀▄▄   ${bf6}▄▀▄▀▀▄▀▄${r}"
echo ""
echo ""
echo -e "                                      ${f7}▌${r}"
echo ""
echo -e "                                  ${f7}▌${r}"
echo ""
echo -e "                               ${f7}    ▄█▄    ${r}"
echo -e "                               ${f7}▄█████████▄${r}"
echo -e "                               ${f7}▀▀▀▀▀▀▀▀▀▀▀${r}"
echo ""
}

palette_pacman () {
# original ANSI colorscheme & art by: pfh
# source: http://crunchbang.org/forums/viewtopic.php?pid=144481#p144481
    echo -e "${r}"
    echo -e "  ${f1}  ▄███████▄                ${f2}  ▄██████▄    ${f3}  ▄██████▄    ${f4}  ▄██████▄    ${f5}  ▄██████▄    ${f6}  ▄██████▄"
    echo -e "  ${f1}▄█████████▀▀               ${f2}▄${f7}█▀█${f2}██${f7}█▀█${f2}██▄  ${f3}▄█${f7}███${f3}██${f7}███${f3}█▄  ${f4}▄█${f7}███${f4}██${f7}███${f4}█▄  ${f5}▄█${f7}███${f5}██${f7}███${f5}█▄  ${f6}▄██${f7}█▀█${f6}██${f7}█▀█${f6}▄"
    echo -e "  ${f1}███████▀      ${f7}▄▄  ▄▄  ▄▄   ${f2}█${f7}▄▄█${f2}██${f7}▄▄█${f2}███  ${f3}██${f7}█ █${f3}██${f7}█ █${f3}██  ${f4}██${f7}█ █${f4}██${f7}█ █${f4}██  ${f5}██${f7}█ █${f5}██${f7}█ █${f5}██  ${f6}███${f7}█▄▄${f6}██${f7}█▄▄${f6}█"
    echo -e "  ${f1}███████▄      ${f7}▀▀  ▀▀  ▀▀   ${f2}████████████  ${f3}████████████  ${f4}████████████  ${f5}████████████  ${f6}████████████"
    echo -e "  ${f1}▀█████████▄▄               ${f2}██▀██▀▀██▀██  ${f3}██▀██▀▀██▀██  ${f4}██▀██▀▀██▀██  ${f5}██▀██▀▀██▀██  ${f6}██▀██▀▀██▀██"
    echo -e "  ${f1}  ▀███████▀                ${f2}▀   ▀  ▀   ▀  ${f3}▀   ▀  ▀   ▀  ${f4}▀   ▀  ▀   ▀  ${f5}▀   ▀  ▀   ▀  ${f6}▀   ▀  ▀   ▀"
    echo ""
    echo -e "  ${bf1}  ▄███████▄                ${bf2}  ▄██████▄    ${bf3}  ▄██████▄    ${bf4}  ▄██████▄    ${bf5}  ▄██████▄    ${bf6}  ▄██████▄"
    echo -e "  ${bf1}▄█████████▀▀               ${bf2}▄${bf7}█▀█${bf2}██${bf7}█▀█${bf2}██▄  ${bf3}▄█${bf7}█ █${bf3}██${bf7}█ █${bf3}█▄  ${bf4}▄█${bf7}█ █${bf4}██${bf7}█ █${bf4}█▄  ${bf5}▄█${bf7}█ █${bf5}██${bf7}█ █${bf5}█▄  ${bf6}▄██${bf7}█▀█${bf6}██${bf7}█▀█${bf6}▄"
    echo -e "  ${bf1}███████▀      ${bf7}▄▄  ▄▄  ▄▄   ${bf2}█${bf7}▄▄█${bf2}██${bf7}▄▄█${bf2}███  ${bf3}██${bf7}███${bf3}██${bf7}███${bf3}██  ${bf4}██${bf7}███${bf4}██${bf7}███${bf4}██  ${bf5}██${bf7}███${bf5}██${bf7}███${bf5}██  ${bf6}███${bf7}█▄▄${bf6}██${bf7}█▄▄${bf6}█"
    echo -e "  ${bf1}███████▄      ${bf7}▀▀  ▀▀  ▀▀   ${bf2}████████████  ${bf3}████████████  ${bf4}████████████  ${bf5}████████████  ${bf6}████████████"
    echo -e "  ${bf1}▀█████████▄▄               ${bf2}██▀██▀▀██▀██  ${bf3}██▀██▀▀██▀██  ${bf4}██▀██▀▀██▀██  ${bf5}██▀██▀▀██▀██  ${bf6}██▀██▀▀██▀██"
    echo -e "  ${bf1}  ▀███████▀                ${bf2}▀   ▀  ▀   ▀  ${bf3}▀   ▀  ▀   ▀  ${bf4}▀   ▀  ▀   ▀  ${bf5}▀   ▀  ▀   ▀  ${bf6}▀   ▀  ▀   ▀"
    echo -e "  ${r}"
}

palette_skull(){
# orginal ANSI colorscheme & art by: xero <http://0w.nz>
    echo -e "${r}"
    echo -e "  ${f7}                  ................."
    echo -e "  ${f7}             .syhhso++++++++/++osyyhys+."
    echo -e "  ${f7}          -oddyo+o+++++++++++++++o+oo+osdms:"
    echo -e "  ${f7}        :dmyo++oosssssssssssssssooooooo+/+ymm+."
    echo -e "  ${f7}       hmyo++ossyyhhddddddddddddhyyyssss+//+ymd-"
    echo -e "  ${f7}     -mho+oosyhhhddmmmmmmmmmmmmmmddhhyyyso+//+hN+"
    echo -e "  ${f7}     my+++syhhhhdmmNNNNNNNNNNNNmmmmmdhhyyyyo//+sd:"
    echo -e "  ${f7}    hs//+oyhhhhdmNNNNNNNNNNNNNNNNNNmmdhyhhhyo//++y"
    echo -e "  ${f7}    s+++shddhhdmmNNNNNNNNNNNNNNNNNNNNmdhhhdhyo/++/"
    echo -e "  ${f7}    .hs+shmmmddmNNNNNNNNNNNNNNNNNNNNNmddddddhs+oh/"
    echo -e "  ${f7}     shsshdmmmmmNNMMMMMMMMMMMNNNNNNNNmmmmmmdhssdh-"
    echo -e "  ${f7}      +ssohdmmmmNNNNNMMMMMMMMNNNNNNmmmmmNNmdhhhs:."
    echo -e "  ${f7}  -+oo++////++sydmNNNNNNNNNNNNNNNNNNNdyyys/--://+//:"
    echo -e "  ${f7}  d/+hmNNNmmdddhhhdmNNNNNNNNNNNNNNNmdhyyyhhhddmmNmdyd-"
    echo -e "  ${f7}  ++--+ymNMMNNNNNNmmmmNNNNNNNNNNNmdhddmNNMMMMMMNmhyss"
    echo -e "  ${f7}   /d+. -+ydmNMMMMMMNNmNMMMMMMMmmmmNNMMMMMNNmh- :sdo"
    echo -e "  ${f7}    sNo   . /ohdmNNMMMMNNMMMMMNNNMMMMMNmdyo/ .  hNh"
    echo -e "  ${f7}     M+.     ..-/oyhmNNMNhNMNhNMMMMNmho/ .     .MN/"
    echo -e "  ${f7}     d+.         .-+osydh0w.nzmNNmho:          .mN:"
    echo -e "  ${f7}    +o/             . :oo+:s :+o/-.            -dds"
    echo -e "  ${f7}   :hdo       ${f2}x${f7}    .-/ooss:.:+ooo: .    ${bf1}0${f7}      :sdm+"
    echo -e "  ${f7}  +dNNNh+         :ydmNNm.   .sddmyo          +hmNmds"
    echo -e "  ${f7} dhNMMNNNNmddhsyhdmmNNNM:      NNmNmhyo+oyyyhmNMMNmysd"
    echo -e "  ${f7} ydNNNNNh+/++ohmMMMMNMNh       oNNNNNNNmho++++yddhyssy"
    echo -e "  ${f7}              .:sNMMMMN.       .mNMNNNd/."
    echo -e "       ${f1}XXXX${f2}XXX${f3}X${f7} y/hMMNm/  .dXb.  -hdmdy: . ${bf5}XXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f7} /o+hNNds. -ymNNy-  .yhys+/.. ${bf5}XX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f7} +-+//o/+odMNMMMNdmh++////-/s ${bf5}XX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XX${f7} mhNd -+d/+myo++ysy/hs -mNsdh/ ${bf5}XX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f7} mhMN+ dMm-/-smy-::dMN/sMMmdo ${bf5}XX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XX${f7} NMy+NMMh oMMMs yMMMyNMMs+ ${bf5}XXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXX${f7} dy-hMMm+dMMMdoNMMh ydo ${bf4}X${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}X ${f7} smm .NMMy dms  sm  ${bf4}XX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XX                   ${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XXXX"
    echo -e "       ${f1}XXXX${f2}XXX${f3}XXXX${f4}XXX${f5}XXXX${f6}XXX${bf1}XXXX${bf2}XXX${bf3}XXXX${bf4}XXX${bf5}XXXX${bf6}XER0"
    echo -e "${r}"
}

palette_tank() {
# original ANSI colorscheme & art by: muzieca
# source: http://crunchbang.org/forums/viewtopic.php?id=13645&p=1
    echo -e "${r}"
    echo -e "  ${f1}    █    ${r}    ${f2}    █    ${r}    ${f3}    █    ${r}    ${f4}    █    ${r}    ${f5}    █    ${r}    ${f6}    █    ${r}"
    echo -e "  ${f1}▄▄  █  ▄▄${r}    ${f2}▄▄  █  ▄▄${r}    ${f3}▄▄  █  ▄▄${r}    ${f4}▄▄  █  ▄▄${r}    ${f5}▄▄  █  ▄▄${r}    ${f6}▄▄  █  ▄▄${r}"
    echo -e "  ${f1}███▀▀▀███${r}    ${f2}███▀▀▀███${r}    ${f3}███▀▀▀███${r}    ${f4}███▀▀▀███${r}    ${f5}███▀▀▀███${r}    ${f6}███▀▀▀███${r}"
    echo -e "  ${f1}███ █ ███${r}    ${f2}███ █ ███${r}    ${f3}███ █ ███${r}    ${f4}███ █ ███${r}    ${f5}███ █ ███${r}    ${f6}███ █ ███${r}"
    echo -e "  ${f1}██ ▀▀▀ ██${r}    ${f2}██ ▀▀▀ ██${r}    ${f3}██ ▀▀▀ ██${r}    ${f4}██ ▀▀▀ ██${r}    ${f5}██ ▀▀▀ ██${r}    ${f6}██ ▀▀▀ ██${r}"
    echo ""
    echo -e "  ${bf1}    █    ${r}    ${bf2}    █    ${r}    ${bf3}    █    ${r}    ${bf4}    █    ${r}    ${bf5}    █    ${r}    ${bf6}    █    ${r}"
    echo -e "  ${bf1}▄▄  █  ▄▄${r}    ${bf2}▄▄  █  ▄▄${r}    ${bf3}▄▄  █  ▄▄${r}    ${bf4}▄▄  █  ▄▄${r}    ${bf5}▄▄  █  ▄▄${r}    ${bf6}▄▄  █  ▄▄${r}"
    echo -e "  ${bf1}███▀▀▀███${r}    ${bf2}███▀▀▀███${r}    ${bf3}███▀▀▀███${r}    ${bf4}███▀▀▀███${r}    ${bf5}███▀▀▀███${r}    ${bf6}███▀▀▀███${r}"
    echo -e "  ${bf1}███ █ ███${r}    ${bf2}███ █ ███${r}    ${bf3}███ █ ███${r}    ${bf4}███ █ ███${r}    ${bf5}███ █ ███${r}    ${bf6}███ █ ███${r}"
    echo -e "  ${bf1}██ ▀▀▀ ██${r}    ${bf2}██ ▀▀▀ ██${r}    ${bf3}██ ▀▀▀ ██${r}    ${bf4}██ ▀▀▀ ██${r}    ${bf5}██ ▀▀▀ ██${r}    ${bf6}██ ▀▀▀ ██${r}"
    echo -e ""
}

case $1 in
    -b)
        blocks_labelled
        ;;
    -n)
        blocks_notext
        ;;
    -l)
        color_list
        ;;
    -a)
        palette_arch
        ;;
    -i)
        palette_invaders
        ;;
    -p)
        palette_pacman
        ;;
    -s)
        palette_skull
        ;;
    -t)
        palette_tank
        ;;
    -h)
        echo -e "\
            \r
            \r Note: pywal is only -required- for option -l
            \r
            \r OPTIONS
            \r -b  color blocks, labelled with ANSI color names
            \r -n  color blocks, no text
            \r -l  colorized list displaying ANSI color names, hex values, and rgb values
            \r -h  show this help message
            \r
            \r SPECIAL PALETTES
            \r -a  arch - original art by Ivo*
            \r -i  space invaders - original art by pfh*
            \r -p  pacman - original art by pfh*
            \r -s  rainbow puke skull - original art by xero http://0w.nz
            \r -t  battle tank - original art by muzieca*
            \r *see script comments for more info on sources for the original scripts that inspired these special palettes
            \r"
        exit 0
        ;;
    *)
        echo -e "\
            \r
            \r Note: pywal is only -required- for option -l
            \r
            \r OPTIONS
            \r -b  color blocks, labelled with ANSI color names
            \r -n  color blocks, no text
            \r -l  colorized list displaying ANSI color names, hex values, and rgb values
            \r -h  show this help message
            \r
            \r SPECIAL PALETTES
            \r -a  arch - original art by Ivo*
            \r -i  space invaders - original art by pfh*
            \r -p  pacman - original art by pfh*
            \r -s  rainbow puke skull - original art by xero http://0w.nz
            \r -t  battle tank - original art by muzieca*
            \r *see script comments for more info on sources for the original scripts that inspired these special palettes
            \r"
        exit 1
esac

exit 0
