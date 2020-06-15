#!/bin/sh

get_avail_mem() {
    tmp_mem=$(($(grep -ri "memavail" /proc/meminfo | awk '{print $2}') / 1024))
    echo ${tmp_mem}M
}

