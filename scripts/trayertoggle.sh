#!/bin/sh

tra_res=$(ps -ef|grep -vE "grep|trayertoggle" |grep -i trayer)
echo $tra_res
if [ "" = "$tra_res" ]; then
    trayer --edge bottom --align right --width 10 --transparent true --alpha 127 --expand true --height 20 --tint 0xffff00ff &
else
    killall trayer
fi

