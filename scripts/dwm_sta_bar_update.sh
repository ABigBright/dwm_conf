#!/bin/sh

if [ $# -lt 1 ]
then
    exit -1
fi

source ./mem_info.sh
source ./net_recv_update.sh
source ./audio_info.sh
source ./ac_info.sh

while [ 1 ]; do
    dwm_mem_info=$(get_avail_mem)
    dwm_net_recv_speed=$(get_net_recieve_speed)
    dwm_net_send_speed=$(get_net_send_speed)
    dwm_aud_volume=$(get_audio_volume)
    dwm_ac_plug=$(get_ac_plug)
    xsetroot -name " $dwm_mem_info ﬠ $dwm_net_recv_speed ﬢ $dwm_net_send_speed $dwm_aud_volume $dwm_ac_plug "
    usleep $1
done
