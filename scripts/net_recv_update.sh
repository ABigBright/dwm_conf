#!/bin/sh

curr_recv=0
curr_recv_seconds=1
curr_send=2
curr_send_seconds=3
iface=$(ip route get 114.114.114.114 |awk '{print $5}')

get_net_recieve_speed() {
    echo $((($curr_recv-$last_recv)/1024/($curr_recv_seconds-$last_seconds)))KB/s
}

get_net_send_speed() {
    echo $((($curr_send-$last_send)/1024/($curr_send_seconds-$last_seconds)))KB/s
}

net_query_update() {
    # for recv query 
    last_recv=$curr_recv
    curr_recv=$(grep -i $iface /proc/net/dev |awk '{print $2}')
    last_seconds=$curr_recv_seconds
    curr_recv_seconds=$(date +%s)

    # for send qurey
    last_send=$curr_send
    curr_send=$(grep -i $iface /proc/net/dev |awk '{print $10}')
    last_seconds=$curr_send_seconds
    curr_send_seconds=$(date +%s)
}

