#!/bin/zsh

echo start exec $@ ...

touchpad_id=$(xinput list|grep -i touchpad|sed -r 's/.*id=(.*)/\1/g'|awk '{print $1}')
touchpad_curr_sta=$(xinput list-props 15|grep -i "device enabled"|awk '{print $4}')

if [ "0" = $touchpad_curr_sta ]
then
    xinput enable $touchpad_id
else
    xinput disable $touchpad_id
fi

echo end exec $@ ...
