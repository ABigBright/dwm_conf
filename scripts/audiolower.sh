#!/bin/zsh

echo start exec $@ ...
pactl set-sink-volume 0 -$1%
echo end exec $@ ...
