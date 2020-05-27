#!/bin/sh

# for networkmanager systray
nm-applet &
# config background pic fill
feh --bg-scale /home/briq/win/e/pic/star.jpg
# config compositor for window manager
picom &
