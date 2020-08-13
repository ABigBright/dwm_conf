#!/bin/sh

curr_recv=0
curr_recv_nanoseconds=1
curr_send=2
curr_send_nano_seconds=3
iface=$(ip route get 114.114.114.114 |awk '{print $5}')

get_net_recieve_speed() {
    recv_kbps=$(echo "1000000000*($curr_recv-$last_recv)/1024/($curr_recv_nanoseconds-$last_recv_nano_seconds)" | bc)

    if [ $recv_kbps -gt 1024 ]
    then
		echo $(echo "scale=2; $recv_kbps/1024" | bc)MB/s
	else
		echo ${recv_kbps}KB/s
	fi
}

get_net_send_speed() {
    send_kbps=$(echo "1000000000*($curr_send-$last_send)/1024/($curr_send_nano_seconds-$last_send_nano_seconds)" | bc)

    if [ $send_kbps -gt 1024 ]
    then
		echo $(echo "scale=2; $send_kbps/1024" | bc)MB/s
	else
		echo ${send_kbps}KB/s
	fi
}

net_query_update() {
    # for recv query 
    last_recv=$curr_recv
    curr_recv=$(grep -i $iface /proc/net/dev |awk '{print $2}')
    last_recv_nano_seconds=$curr_recv_nanoseconds
    curr_recv_nanoseconds=$(date +%s%N) # nano seconds

    # for send qurey
    last_send=$curr_send
    curr_send=$(grep -i $iface /proc/net/dev |awk '{print $10}')
    last_send_nano_seconds=$curr_send_nano_seconds
    curr_send_nano_seconds=$(date +%s%N)
}

