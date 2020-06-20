#!/bin/sh

if [ $# -lt 1 ]
then
    exit 2
fi

dwm_script_prefix=~/.dwm/scripts

. $dwm_script_prefix/mem_info.sh
. $dwm_script_prefix/net_recv_update.sh
. $dwm_script_prefix/audio_info.sh
. $dwm_script_prefix/ac_info.sh
. $dwm_script_prefix/date_info.sh
. $dwm_script_prefix/bat_info.sh

while [ 1 ]; do
    dwm_mem_info=$(get_avail_mem)
    net_query_update
    dwm_net_recv_speed=$(get_net_recieve_speed)
    dwm_net_send_speed=$(get_net_send_speed)
    dwm_aud_volume=$(get_audio_volume)
    dwm_ac_plug=$(get_ac_plug)
    dwm_bat_power=$(get_bat_power)
    xsetroot -name "   $dwm_mem_info ﬠ $dwm_net_recv_speed ﬢ $dwm_net_send_speed $dwm_aud_volume [ $dwm_ac_plug,$dwm_bat_power ] $(get_date) "
    sleep $1
done
