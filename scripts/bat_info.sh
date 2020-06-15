#!/bin/bash

get_bat_power() {
    
    bat_power_tbl=(- - - - -)

    for var in $bat_power_tbl
    do
        echo $var
    done

    bat_power=$(acpi -b|awk '{print $4}'|sed -r 's/(.*)%/\1/g')

    echo -e $bat_power

    if [ $bat_power = "off-line" ]
    then
        echo -e "ﮤ"
    else
        echo -e "ﮣ"
    fi

}

get_bat_power
