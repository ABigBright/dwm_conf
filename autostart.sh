#!/bin/sh

# for screenshot 
flameshot &
# for udisk automount
udiskie &
# for application launcher
albert &
# for fcitx input framework
fcitx &
# for networkmanager systray
nm-applet &
# for bluetooth systray
blueman-applet &
# config background pic fill
feh --bg-scale /home/briq/win/d/work/wallpaper/star.jpg
# config compositor for window manager
picom &

# show info on status bar
killall dwm_sta_bar_update
./scripts/dwm_sta_bar_update.sh 2 &
