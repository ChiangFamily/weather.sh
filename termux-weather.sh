#!/data/data/com.termux/files/usr/bin/bash

# The variable ${LANG%_*} should will display the script output in the default language set in the bash variable.
# Anyway, in cases where this isn't your desired language, is possible replace the variable with your preferred language.
# For change your preferred language, eg in french, set as follows: "Accept-Language: fr" 
# Visit http://wttr.in/:translation for more details about supported languages.

function wttr()
{
    # change Paris to your default location
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}?q0"
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
