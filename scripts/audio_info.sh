#!/bin/bash

get_audio_volume() {
    aud_vol=$(amixer get Master |tail -n1|awk '{print $4}'|sed -r 's/\[(.*)%\]/\1/g')
    aud_mute=$(amixer get Master |tail -n1|awk '{print $6}'|sed -r 's/\[(.*)\]/\1/g')

    if [ $aud_mute = "off" -o $aud_vol = "0" ] 
    then
        aud_vol=0
    fi

    if [ $aud_vol = "0" ]
    then
        echo "婢"
    else
        echo "墳 $aud_vol"
    fi

}

