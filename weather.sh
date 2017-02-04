#!/bin/bash
fallback="Lyon"
command="curl -4 http://wttr.in/"

curl --version > /dev/null 2> /dev/null

if [ $? -ne 0 ]; then
    echo "You need to install curl to run this script"
    exit 2
fi

if [ $# -ge 2 ]; then
    echo "Usage: $0 [city]"
    exit 1
fi

if [ $# -eq 1 ]; then
    city=$1"?lang=fr"
else
    city=$fallback"?lang=fr"
fi

$command$city
