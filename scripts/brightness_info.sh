#!/bin/bash

get_bright() {
    bright_level=$(xbacklight -get |awk -F . '{print $1}')
    echo -e "\Uf05a8 $bright_level"
}

get_bright

