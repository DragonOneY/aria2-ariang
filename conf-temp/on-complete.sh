#!/bin/sh
#echo [$(date)] "Download success."
#echo "Group Id: $1"
#echo "File Num: $2"
#echo "File Path: $3"

#!/bin/bash

downloadpath='aria2/downloads'

filepath=$3
rdp=${filepath#${downloadpath}/}
path=${downloadpath}/${rdp%%/*}
dirpath=${filepath%/*}

if [ $2 -eq 0 ]
    then
        exit 0
elif [ "$path" = "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -gt 1 ]
    then
        [ -e "$dirpath".aria2 ] && rm -vf "$dirpath".aria2
        exit 0
elif [ "$path" != "$filepath" ] && [ $2 -eq 1 ]
    then
        [ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
        exit 0
fi
