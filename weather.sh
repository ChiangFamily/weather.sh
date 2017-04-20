#!/bin/bash

# The variable ${LANG%_*} ensures that the script output is displayed in the language set by the bash variable.
# Is anyway possible replace the variable ${LANG%_*} with your default language.
# Visit http://wttr.in/:translation for more details about supported languages.

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
