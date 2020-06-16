#!/bin/bash

get_bat_power() {
    
    bat_power_tbl=(- - - - -)

    # echo ${bat_power_tbl[2]}
    bat_power=$(acpi -b 2>/dev/null |awk '{print $4}'|sed -r 's/(.*)%/\1/g')

    if [ -z $bat_power ]
    then
        exit 1
    fi

    if [ $bat_power -eq 0 ]
    then
        echo $bat_power% ${bat_power_tbl[0]}
    elif [ $bat_power -le 25 ] 
    then
        echo $bat_power% ${bat_power_tbl[1]}
    elif [ $bat_power -le 50 ]
    then
        echo $bat_power% ${bat_power_tbl[2]}
    elif [ $bat_power -le 75 ]
    then
        echo $bat_power% ${bat_power_tbl[3]}
    elif [ $bat_power -le 100 ]
    then
        echo $bat_power% ${bat_power_tbl[4]}
    fi
}
