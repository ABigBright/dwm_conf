#!/bin/sh

# if [ $# -lt 2 ]
# then
#     echo "para num invalid"
#     exit
# fi

curr_recv=0
curr_seconds=0
curr_send=0
iface=$(ip route get 114.114.114.114 |awk '{print $5}')

get_net_recieve_speed() {
    last_recv=$curr_recv
    curr_recv=$(grep -i $iface /proc/net/dev |awk '{print $2}')
    last_seconds=$curr_seconds
    curr_seconds=$(date +%s)
    echo $((($curr_recv-$last_recv)/1024/($curr_seconds-$last_seconds)))KB/s
}

get_net_send_speed() {
    last_send=$curr_send
    curr_send=$(grep -i $iface /proc/net/dev |awk '{print $10}')
    last_seconds=$curr_seconds
    curr_seconds=$(date +%s)
    echo $((($curr_send-$last_send)/1024/($curr_seconds-$last_seconds)))KB/s
}

# while [ 1 ]; do
#     if [ $1 = "recv" ]
#     then
#         get_net_recieve_speed
#     else
#         get_net_send_speed
#     fi
#
#     sleep $2 # scan result interval (seconds)
# done
