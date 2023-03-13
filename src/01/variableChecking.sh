#!/bin/bash
if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    echo "Неверное количество аргументов."
    exit 1
fi
valid='a-zA-Z'
if [[ $1 =~ [^$valid] ]]; then
    echo "Неверно введены аргументы."
    exit 1
fi
echo $1