#!/bin/sh

# for application launcher
albert &
# for fcitx input framework
fcitx &
# for networkmanager systray
nm-applet &
# config background pic fill
feh --bg-scale /home/briq/win/e/pic/star.jpg
# config compositor for window manager
picom &

# show info on status bar
killall dwm_sta_bar_update
./scripts/dwm_sta_bar_update.sh 1 &
