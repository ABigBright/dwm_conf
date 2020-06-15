#!/bin/bash

get_ac_plug() {
    ac_plug=$(acpi -a 2>/dev/null |awk '{print $3}')

    if [ -z $ac_plug ] 
    then
        exit 1
    fi

    if [ $ac_plug = "off-line" ]
    then
        echo -e "ﮤ"
    else
        echo -e "ﮣ"
    fi

}
