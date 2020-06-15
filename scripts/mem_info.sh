#!/bin/sh

get_avail_mem() {
    tmp_mem=$(($(grep -ri "memavail" /proc/meminfo | awk '{print $2}') / 1024))
    echo -e "\uF0A0 ${tmp_mem}M"
}

