#!/bin/bash

get_ac_plug() {
    ac_plug=$(acpi -a|awk '{print $3}')

    if [ $ac_plug = "off-line" ]
    then
        echo -e "ﮤ"
    else
        echo -e "ﮣ"
    fi

}
