#!/bin/bash

LANG=fr_FR.utf8

function wttr()
{
    # change Paris to your default location
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}"
}

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
    city=$1
fi

wttr $city