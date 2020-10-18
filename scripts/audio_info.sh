#!/bin/bash

get_audio_volume() {
    aud_vol=$(pactl list sinks|awk '$1 ~ /Volume/'|awk '{print $5}'|sed -r 's/(.*)%/\1/g')
    aud_mute=$(pactl list sinks|awk '/Mute/ {print $2}')

    if [ $aud_mute = "yes" -o $aud_vol = "0" ] 
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

