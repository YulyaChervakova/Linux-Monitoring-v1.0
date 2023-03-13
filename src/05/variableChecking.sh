#!/bin/bash
if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi
# valid=$( -d $1)
FILE=$1
if [[ -d "$FILE" ]]; then
    a=`echo $FILE | sed 's|.*/||'`
    valid='a-zA-Z0-9'
    if [[ $a =~ [$valid] ]]; then
        echo "Directory path does not end with "/"."
        exit 1
    fi
else 
    echo "$FILE does not exist."
    exit 1
fi