#!/bin/bash

feh --bg-fill ~/win/e/pic/star.jpg

while [ "1" == $1 ];
do
    feh --recursive -z --bg-fill ~/win/e/pic/
    sleep $2
done

