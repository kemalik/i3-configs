#!/bin/bash

i3status --config ~/.config/i3status/config | while :
do
    read line
    case "$(xset -q|grep LED| awk '{ print $10 }')" in
       "00000002") LG="en" ;;
       "00001002") LG="ru" ;;
       *) LG="unknown" ;;
    esac
    if [ $LG == "en" ]
    then
        dat="[{ \"full_text\": \"  $LG\", \"color\":\"#009E00\" },"
    else
        dat="[{ \"full_text\": \"  $LG\", \"color\":\"#FFFF00\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
