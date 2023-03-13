#!/bin/bash
if [ "$#" -lt 0 ] || [ "$#" -gt 4 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi
# Argument 1-6 
valid='1-6'
i=1;
for color in "$@" 
do
if [[ $color =~ [^$valid]{1} ]]; then
    echo "Неверно введены аргументы."
    exit 1
fi
    i=$((i + 1));
done


